import 'package:ayamku_admin/app/pages/features/order_page/items/item_cancel_order_vertical.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../items/item_delivery_vertical.dart';

class CancelOrderSection extends StatelessWidget {
  const CancelOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text("List Cancel Order", style: txtHeadline3),

              Spacer(),

              InkWell(
                  // onTap: () => voidDeliveryOrder(context),
                  child: SvgPicture.asset(icFilter)
              )
            ]
        ),

        const SizedBox(height: 20,),

        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ItemCancelOrder(
            username: "Username",
            orderName: "Order Name",
            orderTime: DateTime.now(),
            orderPrice: 100000,
          ),

        )


      ],
    );
  }
}
