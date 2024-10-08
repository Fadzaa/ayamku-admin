import 'package:ayamku_admin/app/pages/features/order_page/sections/order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/order_summary_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
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
                Get.offNamedUntil(Routes.HOME_PAGE, (route) => route.settings.name == Routes.HOME_PAGE);
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

          ],
        )
      ),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getAllOrder();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderSummarySection(context: context,),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}









