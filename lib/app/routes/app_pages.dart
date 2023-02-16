import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/view_product/bindings/view_product_binding.dart';
import '../modules/view_product/views/view_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_PRODUCT,
      page: () => const ViewProductView(),
      binding: ViewProductBinding(),
    ),
  ];
}
