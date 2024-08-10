import 'package:ayamku_admin/app/pages/features/order_page/items/item_schedule_vertical.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleOrderSection extends StatelessWidget {
  const ScheduleOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("List Order Schedule", style: txtHeadline3),

              InkWell(
                  // onTap: () => voidFilterPickupOrder(context),
                  child: SvgPicture.asset(icFilter)
              )
            ]
        ),

        const SizedBox(height: 5,),

        const SizedBox(height: 20,),

        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ItemScheduleVertical(
            orderName: "PAHE GEPREK",
            orderPrice: 20000,
            orderStatus: ScheduleStatus.done,
            orderTime: DateTime.now(),
            username: "Fattah Anggit",
            orderId: 1,
          ),

        )


      ],
    );
  }
}
