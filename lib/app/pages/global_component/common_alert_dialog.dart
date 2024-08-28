import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAlertDialog extends StatelessWidget {
  final String title;
  // final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CommonAlertDialog({
    Key? key,
    required this.title,
    this.confirmText = 'Ya',
    this.cancelText = 'Tidak',
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child :  SvgPicture.asset(icCancel,color: Colors.black,)
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: txtBody
              ),
            ),
            SizedBox(height: 10),
            // Text(content),
            // SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 25,  right:25,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LittleBtn(
                      text: confirmText,
                      onPressed: onConfirm,
                      color: greenAlert,
                  ),
                  LittleBtn(
                    text: cancelText,
                    onPressed: onCancel,
                    color: redAlert,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BtnAlert extends StatelessWidget {
  const BtnAlert({super.key, required this.text, required this.color, required this.onTap});
  
  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: txtButtonTab.copyWith(
            color: baseColor,
          )
        ),
      ),
    );
  }
}
