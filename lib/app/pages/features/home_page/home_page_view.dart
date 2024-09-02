import 'package:ayamku_admin/app/pages/features/home_page/items/item_drawer.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/latest_order_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/heading_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/sales_summary_section.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/loading_overlay.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: ItemDrawer(),
        appBar: AppBar(
          backgroundColor: baseColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Halo, Admin! 👋", style: txtListItemTitle),
              Image.asset(
                logoPrimary,
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: RefreshIndicator(
          onRefresh: () async {
            controller.updateStore();
            controller.getLatestOrder(null);
            print("Check Current latest order");

            controller.getSalesSummary('today');
          },
          child: SingleChildScrollView(
            child: Container(
              color: baseColor,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tutup toko",
                        style: txtFormTitle.copyWith(color: blackColor),
                      ),
                      const Spacer(),
                      Obx(() => FlutterSwitch(
                            width: 45.0,
                            height: 25.0,
                            toggleSize: 21.0,
                            value: controller.isActive.value,
                            borderRadius: 12.5,
                            padding: 3.5,
                            activeColor: primaryColor,
                            inactiveColor: Color(0xFFE7E7E8),
                            activeToggleColor: Colors.white,
                            inactiveToggleColor: Colors.white,
                            onToggle: (value) {
                              controller.toggleSwitch(value);
                            },
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HeadingSection(),
                  SizedBox(
                    height: 20,
                  ),
                  SalesSummarySection(),
                  SizedBox(
                    height: 20,
                  ),
                  LatestOrderSection()
                ],
              ),
            ),
          ),
        )));
  }
}
