import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomeController extends GetxController {
  final Connectivity _connectivity = Connectivity();


  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);


  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus).cancel();
  }




  void _updateConnectionStatus(List<ConnectivityResult> event) {
    if (event == ConnectivityResult.none) {
      // Ensure overlay is available by using `WidgetsBinding` callback if needed
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'No Internet Connection',
          'Please check your internet connection',
          isDismissible: false,
          duration: const Duration(days: 5),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.wifi_off, color: Colors.white),
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          shouldIconPulse: true,
        );
      });
    } else {
      if (Get.isSnackbarOpen == true) {
        Get.closeCurrentSnackbar();
      }
    }
  }


}
