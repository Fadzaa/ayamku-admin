import 'package:ayamku_admin/app/pages/features/add_voucher/add_voucher_controller.dart';
import 'package:get/get.dart';

class AddVoucherPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddVoucherPageController>(() => AddVoucherPageController());
  }

}