import 'package:ayamku_admin/app/pages/features/order_page/sections/list_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/order_summary_section.dart';
import 'package:ayamku_admin/app/pages/features/product_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../common/theme.dart';
import 'order_page_controller.dart';

class OrderPageView extends GetView<OrderPageController> {
  const OrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: baseColor,

      appBar: AppBar(
        backgroundColor: baseColor,
          automaticallyImplyLeading: false,
        title: Row(
          children: [

            InkWell(
              onTap: (){
                Get.back();
              },
              child: SvgPicture.asset(
                icBack,
                width: 30,
                height: 30,
              ),
            ),

            SizedBox(width: 10,),

            Text(
              "Order",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),

            Spacer(),

            ItemDropdownDay()
          ],
        )
      ),

      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderSummarySection(),

                SizedBox(height: 25,),

                ListOrderSection()
              ],
            ),
          ),
        ),
      )
    );
  }
}









