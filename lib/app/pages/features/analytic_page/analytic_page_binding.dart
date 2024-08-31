import 'package:get/get.dart';
import 'analytic_page_controller.dart';

class AnalyticPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AnalyticPageController());
  }

}