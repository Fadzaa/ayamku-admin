import 'package:ayamku_admin/app/pages/features/edit_product_page/edit_product_page_controller.dart';
import 'package:get/get.dart';

class EditProductPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProductPageController>(() => EditProductPageController());
  }

}