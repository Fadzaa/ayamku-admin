import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_dropdown_category.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_pick_img.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/app/pages/features/add_promo_page/add_promo_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPromoPage extends GetView<AddPromoPageController> {
  const AddPromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Obx(() => PickImg(
              onTap: () => controller.pickImage(),
              imagePath: controller.selectedImagePath.value,
            )),

            SizedBox(height: 15,),

            ItemTextField(
              text: "Nama Promo",
              hintText: "Pahe Geprek",
              controller: controller.nameController,
            ),

            ItemTextField(
              text: "Nama event",
              hintText: "Selamat hari hari",
              controller: controller.descriptionController,
            ),

            ItemTextField(
              text: "Discount",
              hintText: "Discount",
              controller: controller.discountController,
            ),

            SizedBox(height: 15,),

            ItemTxtCalender(
              text: 'Start date',
              hintText: '',
              onTapSuffixIcon: () => controller.selectDate(context, controller.startDateController),
              controller: controller.startDateController,
            ),

            SizedBox(height: 15),

            ItemTxtCalender(
              text: 'End date',
              hintText: '',
              onTapSuffixIcon: () => controller.selectDate(context, controller.endDateController),
              controller: controller.endDateController,
            ),

          ],
        )
    );
  }
}
