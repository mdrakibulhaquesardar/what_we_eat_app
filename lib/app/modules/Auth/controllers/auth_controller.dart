import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:what_we_eat/app/data/remote_services.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final count = 0.obs;
  RemoteServices remoteServices = RemoteServices();
  final RxBool isLogin = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailControllerSignUp = TextEditingController();
  TextEditingController passwordControllerSignUp = TextEditingController();
  TextEditingController nameControllerSignUp = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

    emailController.clear();
    passwordController.clear();
    emailControllerSignUp.clear();
    passwordControllerSignUp.clear();
    nameControllerSignUp.clear();


    super.onClose();


  }

  void logIn() async {
    isLogin.value = true;
    if (formKey.currentState!.validate()) {
      await remoteServices.login(Get.context!, emailController.text, passwordController.text);
    }
    isLogin.value = false;
  }

 void signUp() async {
      isLogin.value = true;
      if (formKeySignUp.currentState!.validate()) {
      await  remoteServices.signUp(Get.context!, nameControllerSignUp.text, emailControllerSignUp.text, passwordControllerSignUp.text);
     }
     isLogin.value = false;

  }




}
