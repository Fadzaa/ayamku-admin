import 'package:get/get.dart';

import 'pos_page_controller.dart';

class PosPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosPageController>(() => PosPageController());
  }
}