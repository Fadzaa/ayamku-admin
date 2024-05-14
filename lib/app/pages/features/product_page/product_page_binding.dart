import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:get/get.dart';

class ProductPageBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ProductPageController>(() => ProductPageController());
  }

}