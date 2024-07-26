import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constant.dart';
import '../../../common/theme.dart';

class CommonButton extends StatelessWidget {
   CommonButton({
    super.key,
     required this.text,
     required this.onPressed,
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
    return ElevatedButton(
        onPressed: onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          fixedSize: Size(width ?? double.maxFinite, height ?? 0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15)
          ),
        ),
        child: Text(
          text,
          style: style ?? txtButtonTab.copyWith(
            color: blackColor,
          ),
        )

    );
  }
}

class CommonButtonGoogle extends StatelessWidget {
  const CommonButtonGoogle({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          elevation: 2
        ),


        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Masuk dengan Google",
              
              style: txtButtonTab.copyWith(
                color: blackColor,
                fontWeight: FontWeight.w600,)
            ),

            const SizedBox(width: 10,),

            SvgPicture.asset(icGoogle, width: 20, height: 20,),

          ],
        )

    );
  }
}

class CommonButtonOutline extends StatelessWidget {
  CommonButtonOutline({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.style,
  });

  String text;
  VoidCallback onPressed;
  TextStyle? style;
  Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: primaryColor,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: style ?? txtButtonTab.copyWith(
            color: color,
          ),
        ),
      ),
    );
  }
}

class LittleBtn extends StatelessWidget {
  LittleBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.txtColor,
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
  Color? color;
  Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
          color: color ?? primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: style ?? txtButtonTab.copyWith(
            color: txtColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}