import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_dropdown_category.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_pick_img.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/app/pages/features/edit_product_page/edit_product_page_controller.dart';
import 'package:ayamku_admin/common/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductPage extends StatelessWidget {
  EditProductPage({super.key});

  final controller = Get.find<EditProductPageController>();

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
                  Obx(
                        () => PickImg(
                      onTap: () => controller.pickImage(),
                      imagePath: controller.selectedImagePath.value,
                      isImageSelected: controller.isImageSelected,
                    ),
                  ),
                  Obx(() => DropdownCategory(
                        categories: controller.categories,
                        selectedValue: controller.selectedCategory.value,
                        onChanged: (value) =>
                            controller.onChangeCategory(value!),
                      )),
                  ItemTextField(
                    text: "Nama",
                    hintText: "Pahe Geprek",
                    controller: controller.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap masukkan nama produk.';
                      }
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
                        return 'Harap masukkan harga produk.';
                      }
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap masukkan deskripsi produk.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ))));
  }
}
