import 'dart:ffi';

import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({
    Key? key,
    required this.nameController,
    required this.priceController,
    required this.qtyController,
    required this.descriptionController,
    this.hintTxtName,
    this.hintTxtPrice,
    this.hintTxtQty,
    this.hintTxtDesc,
    this.color,
    this.borderColor,
    required this.onTapStartDate,
    required this.onTapEndDate,
    required this.startDateController,
    required this.endDateController,
  }) : super(key: key);


  final Color? color, borderColor;
  final String? hintTxtName, hintTxtPrice, hintTxtQty, hintTxtDesc;
  final TextEditingController nameController, priceController, qtyController, descriptionController,startDateController,endDateController;
  final VoidCallback onTapStartDate, onTapEndDate;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),

        ItemTextField(
          text: "Nama",
          hintText: hintTxtName ?? "Pahe Geprek",
          controller: nameController,
          borderColor: blackColor,
          color: blackColor,
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
                borderColor: borderColor ?? blackColor50,
                color: color ?? blackColor50,
              ),
            ),

            SizedBox(width: 20,),

            Expanded(
              child: ItemTextField(
                text: "QTY",
                hintText: hintTxtQty ?? "3",
                controller: qtyController,
                borderColor: borderColor ?? blackColor50,
                color: color ?? blackColor50,
              ),
            ),
          ],
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

        ItemTextField(
          text: "Deskripsi",
          hintText: hintTxtDesc ?? "txtDescription",
          minLines: 5,
          maxLines: 6,
          controller: descriptionController,
          borderColor: borderColor ?? blackColor50,
          color: color ?? blackColor50,
        ),
      ],
    );
  }
}
