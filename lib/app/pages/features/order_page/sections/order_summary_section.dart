import 'package:ayamku_admin/app/pages/features/order_page/items/filter_all_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_delivery_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_pickup_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_order_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/order_page/model/order_summary_data.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/order_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'schedule_order_section.dart';

class OrderSummarySection extends GetView<OrderPageController> {
  String displayTime() {
    int currentHour = DateTime.now().hour;
    DateTime now = DateTime.now();
    if (currentHour >= 10 && currentHour < 12) {
      return DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, 12, 0));
    } else if (currentHour >= 7 && currentHour < 10) {
      return DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, 9, 40));
    } else {
      return "Selesai";
    }
  }

  late final Map<String, Widget> orderSections;

  OrderSummarySection({Key? key, required this.context}) : super(key: key) {
    orderSections = {
      'Semua': OrderSection(
        methodType: 'Semua',
        header: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("List Order", style: txtHeadline3),
            InkWell(
              onTap: () => voidFilterAllOrder(context),
              child: SvgPicture.asset(icFilter),
            ),
          ],
        ),
      ),
      'on_delivery': displayTime() == "Selesai"
          ? Center(
              child: NotFoundPage(
                  image: sessionOrderOver,
                  title: 'Order Session Over',
                  subtitle:
                      'Sesi order delivery sudah selesai, silahkan cek untuk pemesanan pickup',
                  commonButton: CommonButton(
                    onPressed: () {
                      this.controller.selectSectionType('pickup');
                    },
                    text: 'Pickup',
                  )),
            )
          : OrderSection(
              methodType: 'on_delivery',
              header: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(displayTime(), style: txtCaption),
                  ),
                  const SizedBox(width: 10),
                  Text("List Delivery Order", style: txtHeadline3),
                  Spacer(),
                  InkWell(
                    onTap: () => voidDeliveryOrder(context),
                    child: SvgPicture.asset(icFilter),
                  ),
                ],
              ),
            ),
      'pickup': OrderSection(
        methodType: 'pickup',
        header: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("List Order Pickup", style: txtHeadline3),
            InkWell(
              onTap: () => voidFilterPickupOrder(context),
              child: SvgPicture.asset(icFilter),
            ),
          ],
        ),
      ),
    };
  }

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Summary", style: txtHeadline3),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          itemCount: order_summary_data.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      this.controller.selectSectionType('Semua');
                      break;
                    case "Total Delivery":
                      this.controller.selectSectionType('on_delivery');
                      break;
                    case "Total Pickup":
                      this.controller.selectSectionType('pickup');
                      break;
                  }
                },
              child: Obx(() => ItemOrderSummary(
                title: order_summary_data[index].title,
                icon: order_summary_data[index].icon,
                count: index == 0 ? this.controller.listAllOrder.length
                    : index == 1 ? this.controller.numberOfPickupOrders.value
                    : this.controller.numberOfDeliveryOrders.value,
              ),)
            );
          },
        ),
        const SizedBox(height: 20),
        Obx(() {
          return orderSections[this.controller.selectedFilterTypeOrder.value] ??
              OrderSection(methodType: 'Semua', header: SizedBox.shrink());
        }),
      ],
    );
  }
}

enum OrderType {
  ListOrder,
  Pickup,
  Delivery,
  Schedule,
}
