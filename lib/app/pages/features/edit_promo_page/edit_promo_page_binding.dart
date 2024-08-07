import 'package:ayamku_admin/app/pages/features/edit_promo_page/edit_promo_page_controller.dart';
import 'package:get/get.dart';

class EditPromoPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditPromoPageController>(() => EditPromoPageController());
  }

}