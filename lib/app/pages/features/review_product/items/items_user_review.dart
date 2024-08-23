import 'package:ayamku_admin/app/pages/features/review_product/items/items_detail_review.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ItemsUserReview extends StatelessWidget {
  const ItemsUserReview({
    super.key,
    required this.name,
    required this.date,
    this.comment,
    required this.rating,
    this.onTap});

  final String name, date;
  final String? comment;
  final int rating;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(icPerson),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name, style: txtListItemTitle),

                          Text(date,
                            style: txtCaption.copyWith(color: blackColor50)),
                        ],
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              return Padding(
                                padding: EdgeInsets.only(left: index > 0 ? 3 : 0),
                                child: SvgPicture.asset(
                                  index < rating.toInt() ? starFil : starOutline,
                                  width: 20,
                                  height: 20,
                                ),
                              );
                            }),
                          ),

                          SizedBox(width: 5,),

                          Text(rating.toString(), style: txtCaption),

                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        comment ?? "",
                        style: txtCaption,
                        overflow: TextOverflow.ellipsis,
                      ),

                    ],
                  ),

                ),

              ],
            ),

            SizedBox(height: 5,),

            Divider(color: blackColor80,)
          ],
        ),
      ),
    );
  }
}



