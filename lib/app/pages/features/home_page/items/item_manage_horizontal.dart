import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemManageHorizontal extends StatelessWidget {
  const ItemManageHorizontal({
    Key? key,
    required this.image,
    required this.name,
    this.routes,
  }) : super(key: key);

  final String image, name;
  final String? routes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (routes != null) {
              Get.toNamed(routes!);
            }
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: primaryColor40, shape: BoxShape.circle),
            child: Center(child: Image.asset(image)),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        Text(name, style: txtCaption)
      ],
    );
  }
}
