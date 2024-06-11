import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_controller.dart';
import 'package:get/get.dart';

class DetailOrderPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailOrderPageController>(() => DetailOrderPageController());
  }
}