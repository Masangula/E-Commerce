import 'package:ecommerce/app/modules/home/models/product.dart';
import 'package:ecommerce/app/modules/home/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductsProvider productsProvider = ProductsProvider();
  var listOfProducts = <Product>[].obs;
  var isGettingProducts = false.obs;
  @override
  void onInit() {
    getProducts();
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

  void getProducts() async {
    isGettingProducts.value = true;
    Response response = const Response();
    try {
      response = await productsProvider.fetchingProducts();

      if (response.hasError) {
        debugPrint(response.toString());
        SnackBar(content: Text("Error ${response.statusText}"));
      } else {
        listOfProducts.value = productFromJson(response.bodyString!);
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint(response.toString());
      SnackBar(content: Text("Error ${response.statusText}"));
    }
    isGettingProducts.value = false;
  }
}
