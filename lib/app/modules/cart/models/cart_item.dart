import 'package:ecommerce/app/modules/home/models/product.dart';

class CartItem {
  Product product;
  int count;
  double subtotal = 0.0;

  CartItem({required this.product, required this.count}) {
    updateSubTotal();
  }

  void updateSubTotal() {
    subtotal = 0.0;
    subtotal = product.price! * count;
  }
}
