import 'package:get/get.dart';

import 'splash_page_controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashPageController());
  }
}