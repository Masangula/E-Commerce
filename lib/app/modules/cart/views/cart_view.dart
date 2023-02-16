import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/utils/widgets/custom_button.dart';
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
            : Column(
                children: [
                  ...controller.homeController.myCart.value.cartItems.map(
                    (cartItem) => Container(
                      height: Get.height * 0.15,
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
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
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                              Text(
                                cartItem.product.title!,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
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
                                  Text(
                                    "TZS ${cartItem.product.price!}",
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 124,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // controller.decrementItemCount();
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 10.0,
                                              left: 10,
                                              right: 10,
                                            ),
                                            child: Icon(Icons.minimize_rounded),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "10",
                                            overflow: TextOverflow.clip,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // controller.incementItemCount();
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
      bottomNavigationBar: Container(
        height: Get.height * 0.1,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: double.infinity,
          color: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(10),
          onPressed: () {},
          child: Text(
            "Checkout",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.surface,
                ),
          ),
        ),
      ),
    );
  }
}
