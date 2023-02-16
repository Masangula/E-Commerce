import 'package:ecommerce/app/modules/cart/models/cart_item.dart';

class Cart {
  List<CartItem> cartItems = <CartItem>[];
  double totalAmount = 0.0;

  void updateToatlAmount() {
    totalAmount = 0.0;
    for (CartItem cartItem in cartItems) {
      totalAmount += cartItem.subtotal;
    }
  }
}
