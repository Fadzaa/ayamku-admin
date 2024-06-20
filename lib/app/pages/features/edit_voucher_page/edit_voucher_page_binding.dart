import 'package:ayamku_admin/app/pages/features/edit_voucher_page/edit_voucher_page_controller.dart';
import 'package:get/get.dart';

class EditVoucherPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditVoucherPageController>(() => EditVoucherPageController());
  }
}