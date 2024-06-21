import 'package:ayamku_admin/app/pages/features/order_page/items/item_order_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_all_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_delivery_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/pickup_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DeliveryOrderSection extends StatelessWidget {
  const DeliveryOrderSection({super.key});

  String displayTime() {
    int currentHour = DateTime.now().hour;
    if (currentHour >= 10 && currentHour < 12) {
      return "12.00";
    } else if (currentHour >= 7 && currentHour < 9) {
      return "09.40";
    } else {
      return "Selesai";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(displayTime(), style: txtCaption)
              ),

              SizedBox(width: 10,),

              Text("List Delivery Order", style: txtHeadline3),

              Spacer(),

              InkWell(
                  onTap: () => voidDeliveryOrder(context),
                  child: SvgPicture.asset(icFilter)
              )
            ]
        ),

        const SizedBox(height: 20,),

        displayTime() == "Selesai"

        ? Center(
          child: NotFoundPage(
            image: sessionOrderOver,
            title: 'Order Session Overr',
            subtitle: 'Sesi order delivery sudah selesai, silahkan cek untuk pemesanan pickup',
            commonButton: CommonButton(
              onPressed: (){
                // Get.to(PickupSection());
              },
              text: 'Pickup',
            )
          ),)

        : ListView.builder(
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
