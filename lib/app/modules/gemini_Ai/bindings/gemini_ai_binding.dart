import 'package:get/get.dart';

import '../controllers/gemini_ai_controller.dart';

class GeminiAiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeminiAiController>(
      () => GeminiAiController(),
    );
  }
}
