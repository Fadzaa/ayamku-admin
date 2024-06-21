import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/theme.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.commonButton,
  });

  final String image, title, subtitle;
  final Widget? commonButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(image,width: 250,),

          SizedBox(height: 20),

          Text(
            title,
            style: txtTitlePage.copyWith(
              color: primaryColor
            ),
          ),

          SizedBox(height: 5),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: txtButtonTab.copyWith(color: blackColor),
          ),

          if (commonButton != null) ...[
            SizedBox(height: 20),
            commonButton!,
          ]

        ],
      ),
    );
  }
}
