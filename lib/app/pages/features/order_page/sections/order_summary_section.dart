import 'package:ayamku_admin/app/pages/features/detail_order-page/section/delivery_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_sales_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_order_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/order_page/model/order_summary_data.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/all_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/cancel_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/delivery_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/pickup_section.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'schedule_order_section.dart';

class OrderSummarySection extends GetView<OrderPageController> {
  final Map<String, Widget> orderSections = {
    'Semua': AllOrderSection(),
    'on_delivery': DeliveryOrderSection(),
    'pickup': PickupSection(),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Summary", style: txtHeadline3),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          itemCount: order_summary_data.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: 1.9,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                switch (order_summary_data[index].title) {
                  case "Total Order":
                    controller.updateSelectedType('Semua');
                    break;
                  case "Total Delivery":
                    controller.updateSelectedType('on_delivery');
                    break;
                  case "Total Pickup":
                    controller.updateSelectedType('pickup');
                    break;
                }
              },
              child: ItemOrderSummary(
                title: order_summary_data[index].title,
                icon: order_summary_data[index].icon,
                count: order_summary_data[index].count,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Obx(() {
          return orderSections[controller.selectedFilterTypeOrder.value] ?? AllOrderSection();
        }),
      ],
    );
  }
}


enum OrderSection {
  ListOrder,
  Pickup,
  Delivery,
  Schedule,
}
