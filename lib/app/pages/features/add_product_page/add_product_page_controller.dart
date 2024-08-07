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

  final ProductPageController controller = Get.put(ProductPageController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  RxString selectedCategory = "Geprek".obs;
  RxList<String> categories = ["Geprek", "Snack", "Minuman"].obs;
  RxString selectedImagePath = ''.obs;
  
  ProductService productService = ProductService();
  ProductResponse productResponse = ProductResponse();

  RxString filePathImage = ''.obs;
  RxBool isLoading = false.obs;



  Future<void> pickImage(RxString imagePath) async {
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        imagePath.value = pickedImage.path;
      }
  }

  Future<void> addProduct() async {
    try {
      isLoading.value = true;
      
      dio.FormData formData = dio.FormData.fromMap({
        "name": nameController.text,
        "description": descriptionController.text,
        "price": int.parse(priceController.text),
        "category": selectedCategory.value.toLowerCase(),
        "image": await dio.MultipartFile.fromFile(filePathImage.value),
      });
      
      final response = await productService.addProduct(formData);
      productResponse = ProductResponse.fromJson(response.data);
      
      update();
    } catch (e) {
      if (e is dio.DioError) {
        // Log the response data to check for any server error messages
        print("Response data: ${e.response?.data}");
        
        Get.snackbar(
          "Error",
          e.response?.data['message'] ?? 'An error occurred',
        );
      } else {
        Get.snackbar(
          "Error",
          e.toString(),
        );
      }
      print(e);
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
    descriptionController.clear();
    selectedCategory.value = categories.first;
    imageController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.onClose();
  }

  
}