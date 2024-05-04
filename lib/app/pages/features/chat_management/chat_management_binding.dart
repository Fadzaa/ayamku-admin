import 'package:get/get.dart';
import 'chat_management_controller.dart';

class ChatManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<chatManagementController>(() => chatManagementController());
  }
}