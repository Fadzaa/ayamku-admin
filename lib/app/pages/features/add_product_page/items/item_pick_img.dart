import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';

class PickImg extends StatelessWidget {
  const PickImg({
    Key? key,
    required this.onTap,
    this.imagePath,
  }) : super(key: key);

  final VoidCallback onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: imagePath == null || imagePath!.isEmpty
            ? Container(
             padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
             decoration: BoxDecoration(
             border: Border.all(color: blackColor50),
             borderRadius: BorderRadius.circular(15),
          ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icPickImg,
              ),
              SizedBox(height: 10,),
              Text(
                "Pilih gambar",
                style: txtFormTitle.copyWith(color: blackColor50),
              ),
            ],
          ),
        )
            : Image.file(
          File(imagePath!),
          fit: BoxFit.cover,
          height: 200,
          width: double.infinity,
        ),
      ),
    );
  }
}
