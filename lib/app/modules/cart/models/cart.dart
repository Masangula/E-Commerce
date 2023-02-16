import 'package:ecommerce/app/modules/cart/models/cart_item.dart';
import 'package:get/get.dart';

class Cart {
  var cartItems = <CartItem>[].obs;
  Rx<double> totalAmount = 0.0.obs;

  void updateToatlAmount() {
    totalAmount.value = 0.0;
    for (CartItem cartItem in cartItems) {
      totalAmount.value += cartItem.subtotal.value;
    }
  }
}
