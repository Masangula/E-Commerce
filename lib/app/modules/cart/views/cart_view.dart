import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/colors/app_colors.dart';
import 'package:ecommerce/app/modules/cart/models/cart_item.dart';
import 'package:ecommerce/app/utils/widgets/custom_button.dart';
import 'package:ecommerce/app/utils/widgets/custom_toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 56,
        leading: CustomButton(
          function: () {
            Get.back();
          },
          iconData: Icons.arrow_back_ios_new_outlined,
        ),
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.homeController.myCart.value.totalAmount == 0.0
            ? const Center(
                child: Text(
                  'Your Cart is Empty!',
                  style: TextStyle(fontSize: 20),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ...controller.homeController.myCart.value.cartItems.map(
                      (cartItem) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 3,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: Get.height * 0.17,
                            width: double.infinity,
                            child: Row(
                              // mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.12,
                                  width: Get.height * 0.12,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image(
                                      image: CachedNetworkImageProvider(
                                        cartItem.product.image!,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              cartItem.product.title!,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDeletionItemDialog(
                                                  context, cartItem);
                                            },
                                            child: const Icon(
                                              Icons.delete_outline_rounded,
                                              color: AppColors.redColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        cartItem.product.category!,
                                        overflow: TextOverflow.clip,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Obx(
                                            () => Text(
                                              "TZS ${cartItem.subtotal.value.toStringAsFixed(2)}",
                                              overflow: TextOverflow.clip,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            height: Get.height * 0.06,
                                            width: Get.width * 0.33,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Row(
                                              // mainAxisSize: MainAxisSize.max,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (cartItem.count.value >
                                                        1) {
                                                      cartItem.count.value--;
                                                      cartItem.updateSubTotal();
                                                      controller.homeController
                                                          .myCart.value
                                                          .updateToatlAmount();
                                                    } else {
                                                      CustomToast.primary(
                                                          "Product Count must be greater or equal to 1");
                                                    }
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom: 10.0,
                                                      left: 10,
                                                      right: 10,
                                                    ),
                                                    child: Icon(
                                                        Icons.minimize_rounded),
                                                  ),
                                                ),
                                                Obx(
                                                  () => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      cartItem.count.value
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartItem.count.value++;
                                                    cartItem.updateSubTotal();
                                                    controller.homeController
                                                        .myCart.value
                                                        .updateToatlAmount();
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                    ),
                                                    child: Icon(Icons.add),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
      bottomNavigationBar: Container(
        height: Get.height * 0.15,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL:",
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Obx(
                    () => Text(
                      "TZS ${controller.homeController.myCart.value.totalAmount.toStringAsFixed(2)}",
                      overflow: TextOverflow.clip,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              minWidth: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.all(10),
              onPressed: () {
                controller.checkOut();
              },
              child: Text(
                "Checkout",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDeletionItemDialog(
      BuildContext context, CartItem cartItem) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              "Are you sure you want to delete this product from your cart",
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                color: Theme.of(context).colorScheme.primary,
                child: const Text("close"),
              ),
              MaterialButton(
                onPressed: () {
                  controller.deleteItem(cartItem);
                },
                color: Theme.of(context).colorScheme.onError,
                child: const Text("delete"),
              ),
            ],
          );
        });
  }
}
