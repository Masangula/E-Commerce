import 'package:ecommerce/app/colors/app_colors.dart';
import 'package:ecommerce/app/modules/home/models/filters.dart';
import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:ecommerce/app/utils/widgets/custom_button.dart';
import 'package:ecommerce/app/utils/widgets/custom_messages.dart';
import 'package:ecommerce/app/utils/widgets/product_item_widget.dart';
import 'package:ecommerce/app/utils/widgets/shimmer_widgets.dart';
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
              isLabelVisible: controller.myCart.value.cartItems.isNotEmpty,
              label: Text(
                controller.myCart.value.cartItems.length.toString(),
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
          preferredSize: Size(
            Get.width * 0.9,
            Get.height * 0.12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextField(
                    controller: controller.searchingController,
                    onChanged: (searchString) {
                      if (searchString == "") {
                        controller.isFiltering.value = false;
                        controller.filteredListOfProducts.clear();
                      } else {
                        controller.isFiltering.value = true;
                        controller.filtertingWhenSearching(searchString);
                      }
                    },
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
                        suffixIcon: Obx(
                          () => controller.isFiltering.value
                              ? IconButton(
                                  onPressed: () {
                                    controller.searchingController.clear();
                                    controller.isFiltering.value = false;
                                    controller.filteredListOfProducts.clear();
                                  },
                                  icon: const Icon(Icons.close),
                                )
                              : const SizedBox(),
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    buildFilterSelectionDialog(context);
                  },
                  child: Container(
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.isGettingProducts.value
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return buildProductListShimer(index: index);
                    }),
              )
            : ((controller.isFiltering.value &&
                        controller.filteredListOfProducts.isEmpty) ||
                    controller.listOfProducts.isEmpty)
                ? CustomMessage(
                    lottiesName: "noInternet.json",
                    textMessage: "Sorry, No product found!",
                    leftPadding: Get.width * 0.1,
                    height: 200,
                    width: 200,
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemCount: controller.isFiltering.value
                          ? controller.filteredListOfProducts.length
                          : controller.listOfProducts.length,
                      itemBuilder: (context, index) {
                        return ProductItemWidget(
                            product: controller.isFiltering.value
                                ? controller.filteredListOfProducts[index]
                                : controller.listOfProducts[index]);
                      },
                    ),
                  ),
      ),
    );
  }

  Container buildProductListShimer({int? index}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / (index! + 1),
            child: ShimmerWidget.rectangular(
              width: 200,
              height: 400,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ShimmerWidget.rectangular(
            width: 100,
            height: 10,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ShimmerWidget.rectangular(
                width: 50,
                height: 10,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const ShimmerWidget.circular(width: 20, height: 20)
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> buildFilterSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Filters",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: Get.height * 0.40,
                child: Column(children: [
                  buildFilterItemWidget(
                      filter: controller.listOfFiltersOptions.first),
                  const Divider(),
                  buildFilterItemWidget(
                      filter: controller.listOfFiltersOptions[1]),
                  const Divider(),
                  buildFilterItemWidget(
                      filter: controller.listOfFiltersOptions.last),
                  const Divider(),
                ]),
              ),
            ),
          );
        });
  }

  ListTile buildFilterItemWidget({Filter? filter}) {
    return ListTile(
      title: Text(
        filter!.displayText!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(filter.description!),
      trailing: Obx(
        () => controller.selectedFilter.value == filter.filterType
            ? const Icon(
                Icons.done_outline_rounded,
                color: AppColors.greenColor,
              )
            : const SizedBox(),
      ),
      onTap: () {
        controller.filteringProductsBasedOnFilter(filter.filterType!);
      },
    );
  }
}
