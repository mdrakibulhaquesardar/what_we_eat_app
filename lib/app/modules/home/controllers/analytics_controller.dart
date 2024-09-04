import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:what_we_eat/app/data/remote_services.dart';
import 'package:what_we_eat/app/models/GetProductBycategoryIdModel.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';

class AnalyticsController extends GetxController {
  // Remote service instance
  RemoteServices remoteServices = RemoteServices();

  var progressIndex = 0.obs;
  var currentItemIndex = 0.obs;
  late Timer _timer;
  final int totalItems = 4; // Number of items to process
  var nextRoute = '/';
  var category = Get.parameters['ID'];
  var title = Get.parameters['title'];
  bool isShowSearch = Get.parameters['isShowSearch'] == 'false' ? false : true;


  @override
  Future<void> onInit() async {
    super.onInit();
    analyticsProgress();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  void analyticsProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (Timer timer) {
      progressIndex.value = (progressIndex.value + 1) % 4;

      if (progressIndex.value == 3) { // Assume 3 is the last step for an item
        if (currentItemIndex.value < totalItems - 1) {
          currentItemIndex.value++;
          progressIndex.value = 0;
        } else {
          timer.cancel();
          Get.offNamed(Routes.FOOD_DETAILS,parameters: {"title":"Scanned Product",'ID':"$category" , "isShowSearch":"false"});
        }
      }
    });
  }


}
