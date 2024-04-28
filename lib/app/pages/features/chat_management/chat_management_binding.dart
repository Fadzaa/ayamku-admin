import 'package:get/get.dart';
import 'chat_management_controller.dart';

class NotificationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<chatManagementController>(() => chatManagementController());
  }
}