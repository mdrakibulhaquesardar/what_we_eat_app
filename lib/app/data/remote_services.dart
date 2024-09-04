import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:what_we_eat/app/models/GetProductBycategoryIdModel.dart';
import 'package:what_we_eat/app/models/GetRequestsProductModel.dart';
import 'package:what_we_eat/app/models/UserModel.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';
import 'package:what_we_eat/helpers/api_routes.dart';
import 'package:what_we_eat/helpers/http_error_handler.dart';
import 'package:what_we_eat/helpers/network_api_service.dart';

import 'local_database.dart';

class RemoteServices {
  final NetworkApiService _networkApiService = NetworkApiService();

  Future<GetProductByCategoryIdModel?> getProducts(
      BuildContext context, String categoryId) async {
    final response = await _networkApiService.get(
        ApiRoutes.getProductByCategoryId + categoryId, '');
    httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () {},
        showSnackBar: false);
    final data = response.body;
    return GetProductByCategoryIdModel.fromJson(data);
  }

  Future<void> login(BuildContext context, String email, String password) async {
    try {
      final response = await _networkApiService.post(
          ApiRoutes.login, {'email': email, 'password': password}, '');
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () async {
            UserModel userModel = UserModel.fromJson(response.body);
            LocalDatabase.saveUser(userModel);
            Get.offAllNamed(Routes.NAVBAR);
            Get.snackbar(
              "Successfully Login",
              "Welcome ${userModel.user!.name}",
              backgroundColor: Colors.green.shade400,
              colorText: Colors.white,
              icon: const Icon(Icons.account_circle, color: Colors.white),
              duration: const Duration(milliseconds: 3000),
              snackStyle: SnackStyle.FLOATING,
            );
          },
          showSnackBar: false);
    } catch (e) {
      Get.snackbar("Something went wrong", "$e", backgroundColor: Colors.red, colorText: Colors.white,icon: const Icon(Icons.info_outline));
    }
  }

  Future<void> signUp(
      BuildContext context, String name, String email, String password) async {
    try {
      final response = await _networkApiService.post(ApiRoutes.register,
          {'name': name, 'email': email, 'password': password}, '');
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () async {
            UserModel userModel = UserModel.fromJson(response.body);

            Get.offAllNamed(Routes.AUTH);
            Get.snackbar(
              "Successfully Register",
              "Welcome ${userModel.user!.name} Login Now",
              backgroundColor: Colors.green.shade400,
              colorText: Colors.white,
              icon: const Icon(Icons.account_circle, color: Colors.white),
              duration: const Duration(milliseconds: 3000),
              snackStyle: SnackStyle.FLOATING,
            );
          },
          showSnackBar: false);
    } catch (e) {
      Get.snackbar("Something went wrong", "$e", backgroundColor: Colors.red, colorText: Colors.white,icon: const Icon(Icons.info_outline));
    }
  }

  Future<void> requestProduct(BuildContext context, String name, String barcode,
      String description) async {
    final token = await LocalDatabase.getUser();
    try {
      final response = await _networkApiService.post(
          ApiRoutes.addRequest,
          {'name': name, 'bar_code': barcode, 'description': description},
          token.token!);
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () async {
            Get.snackbar(
              "Request Added Successfully",
              "We will review your request and update",
              backgroundColor: Colors.green.shade400,
              colorText: Colors.white,
              icon: const Icon(Icons.file_copy, color: Colors.white),
              duration: const Duration(milliseconds: 3000),
              snackStyle: SnackStyle.FLOATING,
            );
          },
          showSnackBar: false);
    } catch (e) {
      Get.snackbar("Something went wrong", "$e", backgroundColor: Colors.red, colorText: Colors.white,icon: const Icon(Icons.info_outline));
    }
  }

  Future<GetRequestsProductModel?> getRequestsProduct(
      BuildContext context) async {
    final token = await LocalDatabase.getUser();
    try {
      final response = await _networkApiService.get(ApiRoutes.getRequests, token.token!);
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () async {},
          showSnackBar: false);
      final data = response.body;
      return GetRequestsProductModel.fromJson(data);
    } catch (e) {
      Get.snackbar("Something went wrong", "$e", backgroundColor: Colors.red, colorText: Colors.white,icon: const Icon(Icons.info_outline));
    }
    return null;
  }

  Future<void> logout(BuildContext context) async {
    try {
      final token = await LocalDatabase.getUser();
      final response =
          await _networkApiService.post(ApiRoutes.logout, '', token.token!);
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            print(response.body);
            Get.offAllNamed(Routes.AUTH);
            LocalDatabase.deleteUser();
          },
          showSnackBar: true);
    } catch (e) {
      Get.snackbar("Something went wrong", "$e", backgroundColor: Colors.red, colorText: Colors.white,icon: const Icon(Icons.info_outline));
    }
  }
}
