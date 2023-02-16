import 'package:ecommerce/app/modules/cart/models/cart_item.dart';
import 'package:ecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:ecommerce/app/utils/widgets/custom_toast.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  @override
  void onInit() {
    homeController.myCart.value.updateToatlAmount();
    super.onInit();
  }

  void deleteItem(CartItem cartItem) {
    homeController.myCart.value.cartItems.remove(cartItem);
    homeController.myCart.value.updateToatlAmount();
    CustomToast.success("Item removed from your cart successfull!");
    Get.back();
  }

  void checkOut(){
    homeController.myCart.value.cartItems.clear();
    homeController.myCart.value.updateToatlAmount();
    CustomToast.success("You order is going to be processed!");
    Get.back();
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
