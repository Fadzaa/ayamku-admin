import 'package:ayamku_admin/app/pages/features/add_product_page/add_product_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_dropdown_category.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_pick_img.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProductPage extends GetView<AddProductPageController> {
  const ProductPage({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.nameController,
    required this.priceController,
    required this.qtyController,
    required this.descriptionController,
    required this.imageController,
    this.hintTxtName,
    this.hintTxtPrice,
    this.hintTxtQty,
    this.hintTxtDesc,
    this.color,
    this.borderColor,
    this.selectedImagePath,
  }) : super(key: key);

  final List<String> categories;
  final Color? color, borderColor;
  final String selectedCategory;
  final String? hintTxtName, hintTxtPrice, hintTxtQty, hintTxtDesc, selectedImagePath;
  final ValueChanged<String?> onCategoryChanged;
  final TextEditingController nameController, priceController, qtyController, descriptionController;
  final VoidCallback imageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),

        Obx(() => PickImg(
          onTap: imageController,
          imagePath: selectedImagePath ?? "",
          isImageSelected: controller.isImageSelected,
        ),),


        DropdownCategory(
          categories: categories,
          selectedValue: selectedCategory,
          onChanged: onCategoryChanged,
        ),

        ItemTextField(
          text: "Nama",
          hintText: hintTxtName ?? "Pahe Geprek",
          controller: nameController,
        ),

        SizedBox(height: 15,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ItemTextField(
                text: "Harga",
                hintText: hintTxtPrice ?? "Rp.13.000",
                controller: priceController,
              ),
            ),

            SizedBox(width: 20,),

            Expanded(
              child: ItemTextField(
                text: "QTY",
                hintText: hintTxtQty ?? "3",
                controller: qtyController,
              ),
            ),
          ],
        ),

        SizedBox(height: 15,),

        ItemTextField(
          text: "Deskripsi",
          hintText: hintTxtDesc ?? "txtDescription",
          minLines: 5,
          maxLines: 6,
          controller: descriptionController,
        ),
      ],
    );
  }
}
