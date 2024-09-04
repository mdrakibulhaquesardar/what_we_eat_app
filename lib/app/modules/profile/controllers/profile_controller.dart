import 'package:get/get.dart';
import 'package:what_we_eat/app/data/local_database.dart';
import 'package:what_we_eat/app/data/remote_services.dart';
import 'package:what_we_eat/app/models/GetRequestsProductModel.dart';

class ProfileController extends GetxController {

  RemoteServices remoteServices = RemoteServices();
  final getRequestsProductModel = Rxn<GetRequestsProductModel>();


  //TODO : Make getRequestsProductModel  Obserble


  @override
  void onInit() async {
    super.onInit();
  // getRequestsProduct();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void getRequestsProduct() async{
    final result = await remoteServices.getRequestsProduct(Get.context!);
    getRequestsProductModel.value = result;
  }

  void logout()
  {
    remoteServices.logout(Get.context!);
  }


}
