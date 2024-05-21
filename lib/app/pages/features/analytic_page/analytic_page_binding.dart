import 'package:ayamku_admin/app/pages/features/analytic_page/analytic_page_controller.dart';
import 'package:get/get.dart';

class AnalyticPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AnalyticPageController>(() => AnalyticPageController());
  }

}