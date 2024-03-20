import 'package:ayamku_admin/app/pages/features/home_page/sections/latest_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/list_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/order_summary_section.dart';
import 'package:flutter/material.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order", style: txtTitlePage,),

            Container(
              height: 30,
              width: 100,
              color: primaryColor,
            )
          ],
        ),
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









