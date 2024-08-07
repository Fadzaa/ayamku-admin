import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_pick_img.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../edit_promo_page/edit_promo_page_controller.dart';

class PromoPage extends StatelessWidget {


  final VoidCallback imageController;
  final String selectedImagePath;
  final TextEditingController nameController, eventController, startDateController, endDateController,discountController;
  final Color? borderColor;
  final Color? color;
  final String? hintTxtName;
  final VoidCallback onTapStartDate, onTapEndDate;

  const PromoPage({
    Key? key,
    required this.imageController,
    required this.selectedImagePath,
    required this.nameController,
    required this.discountController,
    this.borderColor,
    this.color,
    this.hintTxtName,
    required this.onTapStartDate,
    required this.onTapEndDate,
    required this.eventController,
    required this.startDateController,
    required this.endDateController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  final controller = Get.find<EditPromoPageController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        PickImg(
          onTap: () => controller.pickImage(),
          imagePath: controller.selectedImagePath.value,
        ),
        SizedBox(height: 15),

        ItemTextField(
          text: "Nama Promo",
          hintText: hintTxtName ?? "Promo Natal",
          controller: nameController,
        ),
        SizedBox(height: 15),

        ItemTextField(
          text: "Nama Event",
          hintText: hintTxtName ?? "Selama Natal",
          controller: eventController,
        ),

        ItemTextField(
              text: "Discount",
              hintText: "Discount",
              controller: discountController,
            ),

        SizedBox(height: 15),

        ItemTxtCalender(
          text: 'Start date',
          hintText: '',
          onTapSuffixIcon: onTapStartDate,
          controller: startDateController,
        ),

        SizedBox(height: 15),

        ItemTxtCalender(
          text: 'End date',
          hintText: '',
          onTapSuffixIcon: onTapEndDate,
          controller: endDateController,
        ),
      ],
    );
  }
}
