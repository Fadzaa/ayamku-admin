import 'package:get/get.dart';
import 'notification_controller.dart';

class NotificationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<notificationPageController>(() => notificationPageController());
  }
}