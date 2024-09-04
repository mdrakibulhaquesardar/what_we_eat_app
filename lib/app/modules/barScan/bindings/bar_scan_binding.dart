import 'package:get/get.dart';

import '../controllers/bar_scan_controller.dart';

class BarScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarScanController>(
      () => BarScanController(),
    );
  }
}
