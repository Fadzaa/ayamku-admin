import 'package:get/get.dart';

class ProductPageController extends GetxController{
  RxString selectedValue = 'All'.obs;
  RxString dropdownValue = "Today".obs;

  void onChangeValue(String selectDay, List<String> items) {
    dropdownValue.value = selectDay;
    items.remove(selectDay);
    items.insert(0, selectDay);
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }
}
