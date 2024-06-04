import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home_page/items/item_order_vertical.dart';

class ItemPickupSection extends StatelessWidget {
  const ItemPickupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(width: 10,),

              Text("List Order", style: txtHeadline3),

              Spacer(),

              SvgPicture.asset(icFilter)
            ]
        ),

        const SizedBox(height: 5,),

        // SizedBox(
        //   height: 30,
        //   child: ListView.builder(
        //       itemCount: listOrder.length,
        //       scrollDirection: Axis.horizontal,
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemBuilder: (context, index) =>
        //           Obx(() => ChipOrder(
        //               text: listOrder[index],
        //               totalOrder: 2,
        //               index: index,
        //               isSelected: controller.currentIndex.value == index
        //           ))
        //   ),
        // ),

        const SizedBox(height: 20,),

        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ItemOrderVertical(
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
