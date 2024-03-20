import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemOrderSummary extends StatelessWidget {
  const ItemOrderSummary({
    super.key,
    required this.title,
    required this.icon,
    required this.count
  });

  final String title, icon;
  final int count;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: const Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: txtCaption),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(count.toString(), style: txtHarga),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: SvgPicture.asset(icon),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
