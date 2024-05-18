import 'package:ayamku_admin/app/pages/features/product_page/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

import '../product_page/product_page_controller.dart';

class AddProductPageController extends GetxController {

  final ProductPageController productPageController = Get.find<ProductPageController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  RxString selectedCategory = "Geprek".obs;
  RxList<String> categories = ["Geprek", "Snack", "Minuman"].obs;
  final ImagePicker _picker = ImagePicker();

  RxString imagePath = RxString("");
  RxString selectedImagePath = ''.obs;

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
    print("Image Selected");
    print(pickedFile?.path);
    print(selectedImagePath.value);
  }

  void onChangeCategory(String category) {
    selectedCategory.value = category;
    categories.remove(category);
    categories.insert(0, category);
  }

  void addProduct() {
    int price = int.parse(priceController.text);
    int qty = int.parse(qtyController.text);

    productPageController.addProduct(Product(
      name: nameController.text,
      price: price,
      qty: qty,
      description: descriptionController.text,
      category: selectedCategory.value,
      image: imageController.text,
    ));
    clearForm();
    Get.back();
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
