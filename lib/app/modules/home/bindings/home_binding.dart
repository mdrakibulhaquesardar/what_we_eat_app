import 'package:get/get.dart';

import 'package:what_we_eat/app/modules/home/controllers/analytics_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalyticsController>(
      () => AnalyticsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
