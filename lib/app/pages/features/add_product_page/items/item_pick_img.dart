import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';

class PickImg extends StatelessWidget {
  const PickImg({
    Key? key,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  final VoidCallback onTap;
  final String imagePath;

  Widget _buildChild() {
    if (imagePath == null || imagePath.isEmpty) {
      return Column(
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
      );
    } else {
      if (imagePath.startsWith('https')) {
        return Image.network(
          imagePath,
          fit: BoxFit.cover,
        );
      } else {
        return Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        );
      }
      return Image.file(
        File(imagePath),
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(10),
        height: 184,
        decoration: BoxDecoration(
          border: Border.all(color: blackColor50),
          borderRadius: BorderRadius.circular(15),
        ),
        child: _buildChild(),
      ),
    );
  }
}
