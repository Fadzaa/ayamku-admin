import 'package:ayamku_admin/app/pages/features/edit_pos_page/edit_pos_page_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class EditPosPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditPosPageController>(() => EditPosPageController());
  }
}