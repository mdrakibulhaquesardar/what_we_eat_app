
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:what_we_eat/app/data/remote_services.dart';
import 'package:what_we_eat/app/models/GetRequestsProductModel.dart';

class RequestsController extends GetxController {
  //TODO: Implement RequestsController
  RemoteServices remoteServices = RemoteServices();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productBarCodeController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  final FocusNode productNameFocusNode = FocusNode();
  final FocusNode productBarCodeFocusNode = FocusNode();
  final FocusNode productDescriptionFocusNode = FocusNode();
  RxBool isLogin = false.obs;
  RxBool checkboxValue = false.obs;



  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;



  @override
  void onInit() async {
    super.onInit();


  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void requestProduct() async {
    if (formKey.currentState!.validate()) {
      isLogin.value = true;
     await remoteServices.requestProduct(
        Get.context!,
        productNameController.text,
        productBarCodeController.text,
        productDescriptionController.text,
      );
      productNameController.clear();
      productBarCodeController.clear();
      productDescriptionController.clear();
      productNameFocusNode.unfocus();
      productBarCodeFocusNode.unfocus();
      productDescriptionFocusNode.unfocus();
      isLogin.value = false;
      checkboxValue.value = false;
    }

  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      print(result!.code);
      productBarCodeController.text = result!.code!;
      Get.back();


    });


  }

  void pauseScanner() {
    controller?.pauseCamera();
  }

  void resumeScanner() {
    controller?.resumeCamera();
  }


  void getRequestsProduct(){
     remoteServices.getRequestsProduct(Get.context!);
  }


}
