import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/colors/app_colors.dart';
import 'package:ecommerce/app/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/view_product_controller.dart';

class ViewProductView extends GetView<ViewProductController> {
  const ViewProductView({Key? key}) : super(key: key);
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
        actions: [
          CustomButton(
            function: () {},
            iconData: Icons.shopping_cart_checkout_outlined,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.4,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(
                    image: CachedNetworkImageProvider(
                      controller.product.image!,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.product.title!,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: controller.product.rating!.rate!,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: AppColors.amberColor,
                          ),
                          onRatingUpdate: (_) {},
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "(${controller.product.rating!.rate!}/5)",
                          overflow: TextOverflow.clip,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Product Details:",
                      overflow: TextOverflow.clip,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Text(
                      controller.product.description!,
                      overflow: TextOverflow.clip,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Price",
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "TZS ${controller.product.price!}",
                          overflow: TextOverflow.clip,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Container(
                          height: 40,
                          width: 124,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.decrementItemCount();
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
                                child: Obx(
                                  () => Text(
                                    controller.itemCount.value.toString(),
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
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.incementItemCount();
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
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          onPressed: () {
            controller.addToMycart();
          },
          child: Text(
            "Add To Cart",
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
