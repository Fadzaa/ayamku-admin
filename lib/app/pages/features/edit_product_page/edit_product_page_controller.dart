import 'package:ayamku_admin/app/api/product/model/product_response.dart';
import 'package:ayamku_admin/app/api/product/product_service.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProductPageController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Product product = Get.arguments;


  RxList<Product> productList = <Product>[].obs;
  RxString selectedCategory = ''.obs;
  RxList<String> categories = ["Geprek", "Snack", "Minuman"].obs;
  ProductResponse productResponse = ProductResponse();
  ProductService productService = ProductService();

  // fetch product
  final ProductPageController productPageController = Get.find<ProductPageController>();
  late int productIndex;
  final ImagePicker _picker = ImagePicker();
  RxBool isLoading = false.obs;

  //image
  RxString selectedImagePath = ''.obs;

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  
  }

  @override
  void onInit() {
    super.onInit();
    nameController.text = product.name!;
    priceController.text = product.price!;
    descriptionController.text = product.description!;
    selectedCategory.value = product.category!;
    selectedImagePath.value = product.image!;


    if (categories.contains(product.category)) {
      selectedCategory.value = product.category!;
    } else {
      selectedCategory.value = categories.first;
    }
  }

  void onChangeCategory(String category) {
    selectedCategory.value = category;
  }

  Future<void> updateProduct() async {
    try {
      isLoading(true);
      final response = await productService.updateProduct(
        product.id.toString(),
        nameController.text,
        descriptionController.text,
        int.parse(priceController.text.toString()), // Changed to double.parse
        selectedImagePath.value,
        selectedCategory.value,
      );
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      productList.addAll(productResponse.data!);

      Get.snackbar(
        "Success",
        "Voucher updated successfully",
      );

      print("Update voucher");
      print('Updated voucher data: ${productResponse.data}');
      print(product);

    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );

    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  Future deleteProduct() async {
    try {
      await productService.deleteProduct(product.id.toString());
    
      Get.back();
    } catch (e) {
      print(e);
    }
  }
  
}
