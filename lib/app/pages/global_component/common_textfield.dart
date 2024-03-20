import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/theme.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isObscure,
  });

  TextEditingController controller;
  String hintText, prefixIcon;
  bool? isObscure;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isObscure ?? false,
        // style: tsLabelLarge,
        decoration: InputDecoration(
          hintText: hintText,
          // hintStyle: tsLabelLarge.copyWith(color: Colors.grey[400]),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: SizedBox(
            width: 15,
            child: Center(
                child: SvgPicture.asset(prefixIcon)
            ),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: primaryColor,
            ),
          ),


        ),
      ),
    );
  }
}