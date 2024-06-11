import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home_page/items/item_order_vertical.dart';

class PickupSection extends StatelessWidget {
  const PickupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("List Order Pickup", style: txtHeadline3),

              SvgPicture.asset(icFilter)
            ]
        ),

        const SizedBox(height: 5,),

        const SizedBox(height: 20,),

        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ItemPickupVertical(
            orderName: "PAHE GEPREK",
            orderPrice: 20000,
            orderStatus: OrderStatus.done,
            orderTime: DateTime.now(),
            username: "Fattah Anggit",
          ),

        )


      ],
    );
  }
}
