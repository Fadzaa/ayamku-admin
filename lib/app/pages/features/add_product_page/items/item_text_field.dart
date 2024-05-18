import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  const ItemTextField({
    super.key,
    required this.text,
    required this.hintText,
    this.minLines,
    this.maxLines,
    this.color,
    this.borderColor,
    this.controller,
  });

  final String text, hintText;
  final int? minLines, maxLines;
  final Color? color,borderColor;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: txtFormTitle.copyWith(color:  blackColor),
        ),
        SizedBox(height: 5,),
        TextFormField(
          controller: controller,
          minLines: minLines ?? 1,
          maxLines: maxLines ?? 2,
          style: txtCaption,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: txtFormTitle.copyWith(color: color ?? blackColor50),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: borderColor ?? blackColor50),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
      ],
    );
  }
}