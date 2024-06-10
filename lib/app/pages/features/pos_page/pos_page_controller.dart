import 'package:get/get.dart';

class PosPageController extends GetxController{
  RxString selectedValue = 'Semua'.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}