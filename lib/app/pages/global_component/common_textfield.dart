import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/theme.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    required this.heading,
    required this.controller,
    required this.hintText,
    this.isObscure,
  });

  TextEditingController controller;
  String hintText, heading;
  bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: txtFormTitle,),

        const SizedBox(height: 10,),

        TextField(
          controller: controller,
          obscureText: isObscure ?? false,
          style: txtFormTitle.copyWith(color: blackColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: txtFormTitle.copyWith(color: Colors.grey[400]),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
