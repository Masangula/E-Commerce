import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/utils/widgets/custom_button.dart';
import 'package:ecommerce/app/utils/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 56,
        leading: CustomButton(
          function: () {},
          iconData: Icons.category_outlined,
        ),
        actions: [
          CustomButton(
            function: () {},
            iconData: Icons.shopping_cart_checkout_outlined,
          ),
        ],
      ),
      body: Obx(
        () => controller.isGettingProducts.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: controller.listOfProducts.length,
                  itemBuilder: (context, index) {
                    return ProductItemWidget(
                        product: controller.listOfProducts[index]);
                  },
                ),
              ),
      ),
    );
  }
}
