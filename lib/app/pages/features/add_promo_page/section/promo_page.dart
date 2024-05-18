import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_pick_img.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  final VoidCallback imageController;
  final String selectedImagePath;
  final TextEditingController nameController, eventController, startDateController, endDateController;
  final Color? borderColor;
  final Color? color;
  final String? hintTxtName;
  final VoidCallback onTapStartDate, onTapEndDate; // Mengubah tipe dateController menjadi VoidCallback

  const PromoPage({
    Key? key,
    required this.imageController,
    required this.selectedImagePath,
    required this.nameController,
    this.borderColor,
    this.color,
    this.hintTxtName,
    required this.onTapStartDate, // Mengubah tipe dateController menjadi VoidCallback
    required this.onTapEndDate, // Mengubah tipe dateController menjadi VoidCallback
    required this.eventController,
    required this.startDateController,
    required this.endDateController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        PickImg(
          onTap: imageController,
          imagePath: selectedImagePath,
        ),
        SizedBox(height: 15),

        ItemTextField(
          text: "Nama Promo",
          hintText: hintTxtName ?? "Promo Natal",
          controller: nameController,
          borderColor: borderColor ?? Colors.black.withOpacity(0.5),
          color: color ?? Colors.black.withOpacity(0.5),
        ),
        SizedBox(height: 15),

        ItemTextField(
          text: "Nama Event",
          hintText: hintTxtName ?? "Selama Natal",
          controller: eventController,
          borderColor: borderColor ?? Colors.black.withOpacity(0.5),
          color: color ?? Colors.black.withOpacity(0.5),
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
