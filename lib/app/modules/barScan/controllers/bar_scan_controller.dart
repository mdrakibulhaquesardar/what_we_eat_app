import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';

class BarScanController extends GetxController {
  final count = 0.obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  String? lastResult;

  QRViewController? controller;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() async {
     controller?.dispose();
     print('Controller disposed');
    super.onClose();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(lastResult == scanData.code){
        return;
      }
      result = scanData;
      Get.offNamed(Routes.ANALYTICS,parameters: {"title":" Scanned Product ","totalItems":"145002","nextRoute":"/food-details",'ID':result?.code ?? "000000000000","isShowSearch":"false"});

    });


  }

  void pauseScanner() {
    controller?.pauseCamera();
  }

  void resumeScanner() {
    controller?.resumeCamera();
  }
}
