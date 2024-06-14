import 'package:ayamku_admin/app/pages/features/option_user/option_user_controller.dart';
import 'package:get/get.dart';

class OptionUserBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OptionUserController>(() => OptionUserController());
  }
}