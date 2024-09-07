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
    this.error = false,
    this.validator,
  });

  final TextEditingController controller;
  final String? hintText;
  final String heading;
  final bool? isObscure;
  final IconData? prefixIcon;
  final VoidCallback? onToggleObscure;
  final String? Function(String?)? validator;
  final bool error;

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
        ),
      ],
    );
  }
}