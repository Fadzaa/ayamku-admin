import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constant.dart';
import '../../../common/theme.dart';

class CommonSearch extends StatelessWidget {
  CommonSearch({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.style,
    this.borderRadius
  });

  String text;
  double? width;
  double? height;
  VoidCallback? onPressed;
  TextStyle? style;
  double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: () => null,
        style: ElevatedButton.styleFrom(
            backgroundColor: lightGrey,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            elevation: 2
        ),
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
        )
    );
  }
}