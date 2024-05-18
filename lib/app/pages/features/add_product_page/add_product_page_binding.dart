import 'package:ayamku_admin/app/pages/features/add_product_page/add_product_page_controller.dart';
import 'package:get/get.dart';

class AddProductPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddProductPageController>(() => AddProductPageController());
  }

}