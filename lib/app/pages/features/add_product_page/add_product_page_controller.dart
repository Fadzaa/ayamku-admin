import 'dart:ffi';

import 'package:ayamku_admin/app/pages/features/product_page/model/product.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/product/product_service.dart';
import '../product_page/product_page_controller.dart';

class AddProductPageController extends GetxController {

  final ProductPageController productPageController = Get.put(ProductPageController());
  ProductService productService = ProductService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  RxString selectedCategory = "Geprek".obs;
  RxList<String> categories = ["Geprek", "Snack", "Minuman"].obs;

  RxString filePathImage = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> pickImage(RxString imagePath) async {
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        imagePath.value = pickedImage.path;
      }
  }

  Future addProduct() async{
    try {
      isLoading.value = true;
      dio.FormData formData = dio.FormData.fromMap({
        "name" : nameController.text,
        "description" : descriptionController.text,
        "price" : priceController.text,
        "category" : categories,
        "stock" : qtyController.text,
        'image': await dio.MultipartFile.fromFile(filePathImage.value),
      });

      await productService.addProduct(
          formData
      );
    }
    catch(e){
      isLoading.value = true;
      print(e);
    }
    finally{
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
