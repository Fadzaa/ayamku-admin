import 'dart:ffi';
import 'package:ayamku_admin/app/api/product/model/product_response.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/product/product_service.dart';
import '../product_page/product_page_controller.dart';

class AddProductPageController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final ProductPageController controller = Get.put(ProductPageController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  RxString selectedCategory = "Geprek".obs;
  RxList<String> categories = ["Geprek", "Snack", "Minuman"].obs;

  RxString filePathImage = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isImageSelected = false.obs;

  //validator error
  RxString nameError = ''.obs;
  RxString qtyError = ''.obs;
  RxString descriptionError = ''.obs;
  RxString priceError = ''.obs;

  ProductService productService = ProductService();


  Future<void> pickImage(RxString imagePath) async {
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        imagePath.value = pickedImage.path;
      }

      print("CHECK CURRENT IMAGE FILE");
      print(filePathImage);

  }

  Future<void> addProduct() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (filePathImage.value.isEmpty) {
      Get.snackbar("Error", "Please select an image");
      return;
    }

    try {
      isLoading.value = true;

      dio.FormData formData = dio.FormData.fromMap({
        "name": nameController.text,
        "description": descriptionController.text,
        "price": int.parse(priceController.text),
        "category": selectedCategory.value.toLowerCase(),
        "image": await dio.MultipartFile.fromFile(filePathImage.value),
      });

      print('FormData: ${formData.fields}');

      await productService.addProduct(formData);
      Get.offNamedUntil(Routes.PRODUCT_PAGE, (routes) => routes.settings.name == Routes.HOME_PAGE);
      Get.snackbar("Tambah produk Sukses", "Berhasil menambahkan produk!");

    } catch (e) {
      isLoading.value = false;
      if (e is dio.DioError) {
        print(e.response!.data);
        Get.snackbar("Error", e.response!.data['message']);
      } else {
        Get.snackbar("Error", "Something went wrong");
      }

    } finally {
      isLoading.value = false;
    }
  }


  void onChangeCategory(String category) {
    selectedCategory.value = category;
    categories.remove(category);
    categories.insert(0, category);
  }


  void clearForm() {
    nameController.clear();
    priceController.clear();
    qtyController.clear();
    descriptionController.clear();
    selectedCategory.value = categories.first;
    imageController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    qtyController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.onClose();
  }


}