import 'package:ayamku_admin/app/pages/features/detail_order-page/section/delivery_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_sales_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_order_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/order_page/model/order_summary_data.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/all_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/cancel_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/delivery_order_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/pickup_section.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

import 'schedule_order_section.dart';

class OrderSummarySection extends StatelessWidget {
  final ValueNotifier<OrderSection> _currentSectionNotifier =
  ValueNotifier(OrderSection.ListOrder);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Summary", style: txtHeadline3),

        const SizedBox(height: 10,),

        GridView.builder(
            shrinkWrap: true,
            itemCount: order_summary_data.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 1.9
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (order_summary_data[index].title == "Total Order") {
                    _currentSectionNotifier.value = OrderSection.ListOrder;
                  }
                  else if (order_summary_data[index].title == "Total Pickup") {
                    _currentSectionNotifier.value = OrderSection.Pickup;
                  } else if (order_summary_data[index].title == "Total Delivery") {
                    _currentSectionNotifier.value = OrderSection.Delivery;
                  } else if (order_summary_data[index].title == "Total Schedule") {
                    _currentSectionNotifier.value = OrderSection.Schedule;
                  } else if (order_summary_data[index].title == "Canceled"){
                    _currentSectionNotifier.value = OrderSection.Cancel;
                  };
                },
                child: ItemOrderSummary(
                  title: order_summary_data[index].title,
                  icon: order_summary_data[index].icon,
                  count: order_summary_data[index].count,
                ),
              );
            }
        ),

        SizedBox(height: 20,),

        ValueListenableBuilder(
          valueListenable: _currentSectionNotifier,
          builder: (context, OrderSection currentSection, child) {
            if (currentSection == OrderSection.ListOrder)
              return AllOrderSection();
            else if (currentSection == OrderSection.Pickup)
              return PickupSection();
            else if (currentSection == OrderSection.Delivery)
              return DeliveryOrderSection();
            else if (currentSection == OrderSection.Schedule)
              return ScheduleOrderSection();
            else if (currentSection == OrderSection.Cancel)
              return CancelOrderSection();
            else
              return SizedBox.shrink();
          },
        )
      ],
    );
  }
}

enum OrderSection {
  ListOrder,
  Pickup,
  Delivery,
  Schedule,
  Cancel,
}
