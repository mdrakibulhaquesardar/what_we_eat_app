import 'package:get/get.dart';
import 'package:what_we_eat/app/modules/home/controllers/home_controller.dart';

class DependencyInjection {
  static void init() {
     Get.put<HomeController>(HomeController(),permanent: true);
  }
}