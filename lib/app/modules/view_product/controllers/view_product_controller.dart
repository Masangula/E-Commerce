import 'package:ecommerce/app/modules/cart/models/cart_item.dart';
import 'package:ecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:ecommerce/app/modules/home/models/product.dart';
import 'package:ecommerce/app/utils/widgets/custom_toast.dart';
import 'package:get/get.dart';

class ViewProductController extends GetxController {
  final Product product = Get.arguments;
  HomeController homeController = Get.find<HomeController>();
  var itemCount = 1.obs;

  void incementItemCount() => itemCount++;
  void decrementItemCount() {
    if (itemCount.value > 1) {
      itemCount--;
    } else {
      CustomToast.primary("Product Count must be greater or equal to 1");
    }
  }

  void addToMycart() {
    var presentItemIndex = homeController.myCart.value.cartItems
        .indexWhere((cartItem) => cartItem.id == product.id);
    if (presentItemIndex == -1) {
      homeController.myCart.value.cartItems.add(
        CartItem(
          product: product,
          count: itemCount,
          id: product.id!,
        ),
      );
    } else {
      homeController.myCart.value.cartItems[presentItemIndex].count.value +=
          itemCount.value;
    }
    CustomToast.success("Product added to Cart successful");
  }

  @override
  void onInit() {
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
