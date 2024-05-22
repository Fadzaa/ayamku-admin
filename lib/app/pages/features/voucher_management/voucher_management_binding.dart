import 'package:get/get.dart';
import 'voucher_management_controller.dart';

class VoucherPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherPageController>(() => VoucherPageController());
  }
}
