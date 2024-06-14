import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/theme.dart';

class CommonSearch extends StatelessWidget {
  CommonSearch({
    super.key,
    required this.text,
    this.controller,
    this.style,
    this.borderRadius
  });

  final String text;
  final TextEditingController? controller;
  final TextStyle? style;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: controller,
      placeholder: text,
      style: txtCaption.copyWith(color: blackColor),
      borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
      placeholderStyle: txtCaption.copyWith(color: blackColor70),
    );
  }
}
