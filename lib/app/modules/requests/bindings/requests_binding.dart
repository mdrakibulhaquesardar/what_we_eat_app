import 'package:get/get.dart';

import '../controllers/requests_controller.dart';

class RequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestsController>(
      () => RequestsController(),
    );
  }
}
