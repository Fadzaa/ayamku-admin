import 'package:get/get.dart';

import '../../../api/pos/model/pos_response.dart';
import '../../../api/pos/pos_service.dart';

class PosPageController extends GetxController{
  RxString selectedValue = 'Semua'.obs;
  RxList<Pos> listPos = <Pos>[].obs;

  PosService productService = PosService();
  PosResponse productResponse = PosResponse();

  RxBool isLoading = false.obs;
  var arguments = Get.arguments;


  Future <void> getAllPos() async {
    try {
      isLoading.value = true;

      final response = await productService.getAllPos();

      print("Fetch Semua Product");
      print(response.data);

      productResponse = PosResponse.fromJson(response.data);
      listPos = productResponse.data!.obs;

      print(listPos);

      print(productResponse.data);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
  
  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }
  

  @override
  void onInit() {
    super.onInit();
    
    getAllPos();
  }
}