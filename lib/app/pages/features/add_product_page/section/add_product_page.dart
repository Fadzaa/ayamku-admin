import 'package:ayamku_admin/app/pages/features/add_product_page/add_product_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_dropdown_category.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/common/loading_overlay.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../items/item_pick_img.dart';

class AddProductPage extends GetView<AddProductPageController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            body: Form(
              key: controller.formKey,
              child: Column(
                children: [

                  Obx(() => PickImg(
                    onTap: () => controller.pickImage(controller.filePathImage),
                    imagePath: controller.filePathImage.value,
                    isImageSelected: controller.isImageSelected,
                  ),),
                  Obx(
                    () => DropdownCategory(
                      color: blackColor50,
                      categories: controller.categories,
                      selectedValue: controller.selectedCategory.value,
                      onChanged: (value) => controller.onChangeCategory(value!),
                    ),
                  ),
                  ItemTextField(
                    text: "Nama",
                    hintText: "Pahe Geprek",
                    controller: controller.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.nameError.value =
                        'Harap masukkan nama produk.';
                        return controller.nameError.value;
                      }
                      controller.nameError.value = '';
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ItemTextField(
                    text: "Harga",
                    hintText: "Rp.13.000",
                    controller: controller.priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.priceError.value =
                        'Harap masukkan harga produk.';
                        return controller.priceError.value;
                      }
                      controller.priceError.value = '';
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ItemTextField(
                    text: "Deskripsi",
                    hintText: "Ayam goreng dengan saus mozarella",
                    minLines: 5,
                    maxLines: 6,
                    controller: controller.descriptionController,
                    error: controller.descriptionError.value.isNotEmpty,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.descriptionError.value =
                            'Harap masukkan deskripsi produk.';
                        return controller.descriptionError.value;
                      }
                      controller.descriptionError.value = '';
                      return null;
                    },
                  ),
                ],
              ),
            ))));
  }
}
