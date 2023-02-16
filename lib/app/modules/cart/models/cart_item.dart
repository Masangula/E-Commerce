import 'package:ecommerce/app/modules/home/models/product.dart';
import 'package:get/get.dart';

class CartItem {
  Product product;
  int id;
  Rx<int> count;
  Rx<double> subtotal = 0.0.obs;

  CartItem({required this.product, required this.count,required this.id,}) {
    updateSubTotal();
  }

  void updateSubTotal() {
    subtotal.value = 0.0;
    subtotal.value = (product.price! * count.value);
  }
}
