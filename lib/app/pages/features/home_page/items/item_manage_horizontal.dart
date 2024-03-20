import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ItemManageHorizontal extends StatelessWidget {
  const ItemManageHorizontal({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: primaryColor80,
            shape: BoxShape.circle
          ),

          child: Center(
            child: Image.asset(image)
          )
        ),

        const SizedBox(height: 10,),

        Text(name, style: txtCaption)
      ],
    );
  }
}
