import 'package:ayamku_admin/app/pages/features/add_pos_page/add_pos_page_controller.dart';
import 'package:get/get.dart';

class AddPosPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPosPageController>(() => AddPosPageController());
  }
}