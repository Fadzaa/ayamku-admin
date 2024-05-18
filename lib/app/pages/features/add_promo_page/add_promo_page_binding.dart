import 'package:ayamku_admin/app/pages/features/add_promo_page/add_promo_page_controller.dart';
import 'package:get/get.dart';

class AddPromoPageBinding extends  Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddPromoPageController>(() => AddPromoPageController());
  }

}