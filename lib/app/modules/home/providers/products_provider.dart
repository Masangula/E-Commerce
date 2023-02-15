import 'package:ecommerce/app/utils/urls.dart';
import 'package:get/get.dart';

class ProductsProvider extends GetConnect {
  final myHttpClient = GetConnect(
    timeout: const Duration(
      seconds: 60,
    ),
  );

  Future fetchingProducts() async {
    Response response = await myHttpClient.get(Urls.fetchingProducts);

    return response;
  }
}
