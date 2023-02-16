import 'package:ecommerce/app/routes/app_pages.dart';
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
           Obx(
            () => Badge(
              alignment: AlignmentDirectional.centerEnd,
              textColor: Theme.of(context).colorScheme.surface,
              isLabelVisible:
                  controller.myCart.value.cartItems.isNotEmpty,
              label: Text(
                controller.myCart.value.cartItems.length
                    .toString(),
              ),
              child: CustomButton(
                function: () {
                  Get.toNamed(Routes.CART);
                },
                iconData: Icons.shopping_cart_checkout_outlined,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(Get.width * 0.9, Get.height * 0.12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextField(
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                          width: 1.5,
                        ),
                      ),
                      hintText: "Seach Product...",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Icon(
                    Icons.clear_all_outlined,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                )
              ],
            ),
          ),
        ),
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
