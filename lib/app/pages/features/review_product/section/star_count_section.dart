import 'package:ayamku_admin/app/api/review/model/review_response.dart';
import 'package:ayamku_admin/app/pages/features/review_product/review_product_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StarCountSection extends GetView<ReviewProductPageController> {
  const StarCountSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(controller.reviewResponse.ratingAvg.toString(), style: txtHeadline1),

                  SizedBox(width: 5,),

                  Text("/ 5", style: txtSecondaryTitle),
                ],
              ),
              Text("${controller.reviewResponse.ratingCount.toString()} review", style: txtSecondaryTitle),
            ],
          ),
        ),

        SizedBox(width: 15,),

        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(5, (index) {
              int starRating = 5 - index;
              int count;
              switch (starRating) {
                case 5:
                  count = controller.reviewResponse.i5Stars ?? 0;
                  break;
                case 4:
                  count = controller.reviewResponse.i4Stars ?? 0;
                  break;
                case 3:
                  count = controller.reviewResponse.i3Stars ?? 0;
                  break;
                case 2:
                  count = controller.reviewResponse.i2Stars ?? 0;
                  break;
                case 1:
                  count = controller.reviewResponse.i1Stars ?? 0;
                  break;
                default:
                  count = 0;
              }
              double value = (controller.reviewResponse.ratingCount != null && controller.reviewResponse.ratingCount! > 0) ? count / controller.reviewResponse.ratingCount! : 0;
              return RatingCount(count: count, value: value, star: starRating);
            }),
          ),
        )


      ],
    );
  }
}

class RatingCount extends StatelessWidget {
  const RatingCount({super.key, required this.count, required this.value, required this.star});

  final int count;
  final int star;
  final double value;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.8;
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Padding(
              padding: EdgeInsets.only(left: index > 0 ? 5 : 0),
              child: SvgPicture.asset(
                index < star ? icStar : icStarOutline,
                width: 15,
                height: 15,
              ),
            );
          }),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 11,
          child: SizedBox(
              height: 10,
              width: screenWidth,
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: blackColor90,
                borderRadius: BorderRadius.circular(5),
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              )
          ),
        ),

        SizedBox(width: 10,),

        Expanded(child: Text(count.toString(), style: txtBody,)),
      ],
    );
  }
}