import 'package:ayamku_admin/app/pages/features/product_page/model/product_data.dart';
import 'package:get/get.dart';

import 'model/product.dart';

class ProductPageController extends GetxController{
  RxString selectedValue = 'All'.obs;
  RxString dropdownValue = "Today".obs;
  RxList<Product> products = product_data;



  void addProduct(Product product) {
    products.add(product);
  }

  void updateProduct(int index, Product product) {
    products[index] = product;
  }

  void deleteProduct(int index) {
    products.removeAt(index);
  }

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
