import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../../common/theme.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    this.heading = "",
    required this.controller,
    required this.hintText,
    this.isObscure,
    this.prefixIcon,
    this.onToggleObscure,
  });

  final TextEditingController controller;
  final String? hintText;
  final String heading;
  final bool? isObscure;
  final IconData? prefixIcon;
  final VoidCallback? onToggleObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading != null ? Text(heading!, style: txtFormTitle) : Container(),

        const SizedBox(height: 10,),

        SizedBox(
          height: 45,
          child: TextField(
            controller: controller,
            obscureText: isObscure ?? false,
            style: txtFormTitle.copyWith(color: blackColor),

            decoration: InputDecoration(
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: isObscure != null
                  ? IconButton(
                onPressed: onToggleObscure,
                icon: Icon(isObscure!
                    ? Icons.visibility
                    : Icons.visibility_off),
              )
                  : null,
              hintText: hintText,
              hintStyle: txtFormTitle.copyWith(color: Colors.grey[400]),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              contentPadding: EdgeInsets.only(top: 10, left: 20),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}