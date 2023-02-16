import 'package:ecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  @override
  void onInit() {
    homeController.myCart.value.updateToatlAmount();
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
}
