import 'package:ayamku_admin/app/api/product/model/product_response.dart';
import 'package:ayamku_admin/app/api/product/product_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class ProductPageController extends GetxController{
  RxString selectedValue = 'All'.obs;
  RxString dropdownValue = "Today".obs;
  RxBool isLoadingAll = false.obs;

  RxString filePathImage = ''.obs;

  RxList<Product> listProduct = <Product>[].obs;
  ProductService productService = ProductService();
  ProductResponse productResponse = ProductResponse();


@override
  void onInit() {
    super.onInit();

    getAllProduct();
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

  void getAllProduct () async {
    try {
      isLoadingAll.value = true;

      final response = await productService.getAllProduct();

      print("Fetch Semua Warung");
      print(response.data);

      productResponse = ProductResponse.fromJson(response.data);
      listProduct = productResponse.data!.obs;

      print("Fetch Semua product");
      print(listProduct);


      print(productResponse.data);
    } catch (e) {
      isLoadingAll.value = true;
      print(e);
    } finally {
      isLoadingAll.value = false;
    }
  }

}
