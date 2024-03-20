import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/theme.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          const SizedBox(height: 20),
          // Text(
          //   title,
          //   style: tsBodyLarge.copyWith(
          //     fontWeight: FontWeight.w600,
          //     color: blackColor
          //   ),
          // ),
          //
          // Text(
          //   subtitle,
          //   style: tsBodySmall.copyWith(
          //       fontWeight: FontWeight.w500,
          //       color: greyColor
          //   ),
          // ),

          const SizedBox(height: 100,)



        ],
      ),
    );
  }
}
