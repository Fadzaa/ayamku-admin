import 'package:ayamku_admin/app/pages/features/home_page/items/item_drawer.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/latest_order_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/heading_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/sales_summary_section.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ItemDrawer(),
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
        child: SingleChildScrollView(
          child: Container(
            color: baseColor,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingSection(),
                        
                SizedBox(height: 20,),
                        
                SalesSummarySection(),
                        
                SizedBox(height: 20,),
                        
                LatestOrderSection()
                        
                        
              ],
            ),
          ),
        ),
      )
    );
  }
}









