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
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RxString selectedCategory = "Geprek".obs;
  RxList<String> categories = ["Geprek", "Snack", "Minuman"].obs;
  ProductResponse productResponse = ProductResponse();
  ProductService productService = ProductService();

  final ProductPageController productPageController = Get.find<ProductPageController>();
  late int productIndex;
  final ImagePicker _picker = ImagePicker();
  RxBool isLoading = false.obs;


  RxString selectedImagePath = ''.obs;

  Product product = Get.arguments;
  

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
    qtyController.text = product.stock.toString();
    descriptionController.text = product.description!;
    // selectedCategory.value = product.category!;
    selectedImagePath.value = product.image!;

    // // Ensure the selectedCategory is valid
    // if (!categories.contains(selectedCategory.value)) {
    //   selectedCategory.value = categories.first;
    // }
  }

  void onChangeCategory(String category) {
    selectedCategory.value = category;
  }

  void updateProduct() {
    int price = int.parse(priceController.text);
    int qty = int.parse(qtyController.text);

    // productPageController.updateProduct(productIndex, Product(
    //   name: nameController.text,
    //   price: price,
    //   qty: qty,
    //   description: descriptionController.text,
    //   category: selectedCategory.value,
    //   image: selectedImagePath.value,
    // ));
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    qtyController.dispose();
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

  Future editProduct() async {
    try {
      isLoading.value = true;
      dio.FormData formData = dio.FormData.fromMap({
        "name" : nameController.text,
        "description" : descriptionController.text,
        "price" : priceController.text,
        "category" : categories,
        "stock" : qtyController.text,
        'image': await dio.MultipartFile.fromFile(selectedImagePath.value),
      });

      await productService.updateProduct(
          formData, product.id.toString(),
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
  
}
