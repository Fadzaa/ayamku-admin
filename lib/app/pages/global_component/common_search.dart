import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constant.dart';
import '../../../common/theme.dart';

class CommonSearch extends StatelessWidget {
  CommonSearch({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.borderRadius
  });

  String text;
  VoidCallback? onPressed;
  TextStyle? style;
  double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SvgPicture.asset(icSearch, width: 20, height: 20,),

            const SizedBox(width: 10,),

            Text(
                text,
                style: txtCaption.copyWith(
                color: blackColor50
            ),
            ),

          ],
        ),
      ),
    );
  }
}