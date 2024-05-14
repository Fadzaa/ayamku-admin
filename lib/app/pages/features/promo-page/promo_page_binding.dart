import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:get/get.dart';

class PromoPageBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut <PromoPageController> (() => PromoPageController());
  }
}