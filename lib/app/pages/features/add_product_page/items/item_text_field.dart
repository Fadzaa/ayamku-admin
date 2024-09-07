import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  const ItemTextField({
    super.key,
    required this.text,
    required this.hintText,
    this.minLines,
    this.maxLines,
    this.controller,
    this.error = false,
    this.validator,
  });

  final String text, hintText;
  final int? minLines, maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: txtFormTitle.copyWith(color: blackColor),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines ?? 1,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: txtFormTitle.copyWith(color: blackColor50),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: blackColor),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorText: error ? 'Error occurred' : null,
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class ItemTxtCalender extends StatelessWidget {
  const ItemTxtCalender({
    super.key,
    required this.text,
    required this.hintText,
    this.minLines,
    this.maxLines,
    this.color,
    this.borderColor,
    required this.controller,
    required this.onTapSuffixIcon,
    this.validator,
    this.error = false,
  });

  final String text, hintText;
  final int? minLines, maxLines;
  final Color? color, borderColor;
  final TextEditingController controller;
  final VoidCallback onTapSuffixIcon;
  final String? Function(String?)? validator;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: txtFormTitle.copyWith(color: blackColor),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: validator,
          readOnly: true,
          controller: controller,
          minLines: minLines ?? 1,
          maxLines: maxLines ?? 2,
          decoration: InputDecoration(
            suffixIcon: InkWell(
                onTap: onTapSuffixIcon,
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: blackColor50,
                )),
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorText: error ? 'Error occurred' : null,
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
