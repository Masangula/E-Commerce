import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/app/modules/cart/models/cart.dart';
import 'package:ecommerce/app/modules/home/models/filters.dart';
import 'package:ecommerce/app/modules/home/models/product.dart';
import 'package:ecommerce/app/modules/home/providers/products_provider.dart';
import 'package:ecommerce/app/utils/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //variable for cheking if the user is connected to the internet
  var connectionStatus = 0.obs;
  var error = "";
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;


  final ProductsProvider productsProvider = ProductsProvider();
  final TextEditingController searchingController = TextEditingController();
  var listOfProducts = <Product>[].obs;
  var filteredListOfProducts = <Product>[].obs;
  var isFiltering = false.obs;
  var isGettingProducts = false.obs;
  var myCart = Cart().obs;
  var selectedFilter = Filters.shuffled.obs;
  final listOfFiltersOptions = [
    Filter(
        displayText: "Shuffled",
        filterType: Filters.shuffled,
        description: "Products list will be shuffled"),
    Filter(
        displayText: "Ratings",
        filterType: Filters.ratings,
        description:
            "Product list will be arranged based on high rating to low ratings"),
    Filter(
        displayText: "Prices",
        filterType: Filters.prices,
        description:
            "Product list will be arranged based on low prices to high prices"),
  ];
  @override
  void onInit() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    getProducts();
    super.onInit();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      error = e.toString();
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.mobile:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.wifi:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.bluetooth:
        connectionStatus.value = 3;
        break;
      case ConnectivityResult.ethernet:
        connectionStatus.value = 4;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
      case ConnectivityResult.vpn:
        break;
      case ConnectivityResult.other:
        // Nothing to handle
        break;
    }
  }

  @override
  void onClose() {
    searchingController.dispose();
    super.onClose();
  }

  void filtertingWhenSearching(String searchString) {
    filteredListOfProducts.clear();
    filteredListOfProducts.value = listOfProducts
        .where((product) =>
            product.title!.toLowerCase().contains(searchString.toLowerCase()))
        .toList();
  }

  void filteringProductsBasedOnFilter(Filters choosedFilter) {
    selectedFilter.value = choosedFilter;
    if (choosedFilter == Filters.prices) {
      listOfProducts.sort(
          (product1, product2) => product1.price!.compareTo(product2.price!));
    } else if (choosedFilter == Filters.ratings) {
      listOfProducts.sort((product1, product2) =>
          product1.rating!.rate!.compareTo(product2.rating!.rate!));
      listOfProducts.value = listOfProducts.reversed.toList();
    } else {
      listOfProducts.shuffle();
    }
  }

  void getProducts() async {
    isGettingProducts.value = true;
    Response response = const Response();
    try {
      response = await productsProvider.fetchingProducts();

      if (response.hasError) {
        debugPrint(response.toString());
        CustomToast.error("Error ${response.statusText}");
      } else {
        listOfProducts.value = productFromJson(response.bodyString!);
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint(response.toString());
      CustomToast.error("Error ${response.statusText}");
    }
    isGettingProducts.value = false;
  }
}
