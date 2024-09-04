import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:what_we_eat/app/data/remote_services.dart';
import 'package:what_we_eat/app/models/GetProductBycategoryIdModel.dart';

class FoodDetailsController extends GetxController {
  //TODO: Implement FoodDetailsController

  RemoteServices remoteServices = RemoteServices();

  var category = Get.parameters['ID'];
  var title = Get.parameters['title'];
  bool isShowSearch = Get.parameters['isShowSearch'] == 'false' ? false : true;

  var productByCategoryIdModel = Rxn<GetProductByCategoryIdModel>(); // Make it observable

  var filteredProducts = <Product>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    print("Category Id Here: $category");
    productByCategoryIdModel.value = await remoteServices.getProducts(Get.context!, category!);
    print("productByCategoryIdModel: ${productByCategoryIdModel.value?.message}");
    print("Category: $category");


    // Initialize filteredProducts with the fetched products
    filteredProducts.value = productByCategoryIdModel.value?.products ?? [];
  }

  @override
  void onReady() {
    super.onReady();

    if(productByCategoryIdModel.value?.message == "No products found"){
      Get.snackbar("No products found", "No products found in this category",backgroundColor: Colors.red, colorText: Colors.white,icon: const Icon(Icons.info_outline));
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.value = productByCategoryIdModel.value?.products ?? [];
    } else {
      filteredProducts.value = productByCategoryIdModel.value?.products
          ?.where((product) => product.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList() ??
          [];
    }
  }


}
