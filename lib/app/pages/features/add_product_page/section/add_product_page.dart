import 'package:ayamku_admin/app/pages/features/add_product_page/add_product_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_dropdown_category.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
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
      child: Column(
        children: [
          Obx(() => PickImg(
            onTap: () => controller.pickImage(controller.filePathImage),
            imagePath: controller.filePathImage.value,
          ),),

          DropdownCategory(
            color: blackColor50,
            categories: controller.categories,
            selectedValue: controller.selectedCategory.value,
            onChanged: (value) => controller.onChangeCategory(value!),
          ),

          ItemTextField(
            text: "Nama",
            hintText: "Pahe Geprek",
            controller: controller.nameController,
          ),

          SizedBox(height: 15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ItemTextField(
                  text: "Harga",
                  hintText: "Rp.13.000",
                  controller: controller.priceController,
                ),
              ),

              SizedBox(width: 20,),

              Expanded(
                child: ItemTextField(
                  text: "QTY",
                  hintText: "3",
                  controller: controller.qtyController,
                ),
              ),
            ],
          ),

          SizedBox(height: 15,),

          ItemTextField(
            text: "Deskripsi",
            hintText: "Ayam goreng dengan saus mozarella",
            minLines: 5,
            maxLines: 6,
            controller: controller.descriptionController,
          ),

        ],
      )
    );
  }
}
