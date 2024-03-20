import 'package:get/get.dart';

import 'order_page_controller.dart';

class OrderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPageController>(() => OrderPageController());
  }
}