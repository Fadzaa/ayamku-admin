import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import '../../../common/constant.dart';
import '../../../common/theme.dart';

class CommonSearch extends StatelessWidget {
  CommonSearch({
    super.key,
    required this.text,
    this.controller,
    this.style,
    this.borderRadius
  });

  String text;
  TextEditingController? controller;
  TextStyle? style;
  double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
        controller: controller,
        placeholder: text,
        style: txtCaption.copyWith(color: blackColor),
        borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
        placeholderStyle: txtCaption.copyWith(color: blackColor70)

    );
  }
}