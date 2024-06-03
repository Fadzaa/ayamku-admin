import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../features/edit_product_page/edit_product_page_controller.dart';

class CommonBottom extends GetView<EditProductPageController> {
  const CommonBottom({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
    required this.bgColor1,
    required this.bgColor2,
    required this.ic1,
    required this.ic2,
    required this.txtColor1,
    required this.txtColor2,
    required this.txt1,
    required this.txt2
  });

  final VoidCallback onPressed1, onPressed2;
  final Color bgColor1, bgColor2, txtColor1, txtColor2;
  final String ic1, ic2, txt1, txt2;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 50),
      decoration: BoxDecoration(
        color: baseColor,
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          WidgetBottomBtn(
              onPressed: () => controller.deleteProduct(),
              icon: ic1,
              text: txt1,
              bgColor: bgColor1,
              txtColor: txtColor1,
          ),

          WidgetBottomBtn(
              onPressed: () => controller.editProduct(),
              icon: ic2,
              text: txt2,
              bgColor: bgColor2,
              txtColor: txtColor2,
          ),
        ],
      ),
    );
  }
}

class WidgetBottomBtn extends StatelessWidget {
  const WidgetBottomBtn({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.bgColor,
    required this.txtColor,
  });

  final VoidCallback onPressed;
  final  String icon, text;
  final Color bgColor, txtColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [

            SvgPicture.asset(
              icon
            ),

            SizedBox(width: 10,),

            Text(
              text,
              style: txtButtonTab.copyWith(color: txtColor),
            )
          ],
        ),
      ),
    );
  }
}
