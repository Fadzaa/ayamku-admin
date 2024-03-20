import 'package:ayamku_admin/app/pages/features/home_page/sections/list_order_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/heading_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/sales_summary_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/theme.dart';
import 'home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingSection(),

                SizedBox(height: 20,),

                SalesSummarySection(),

                SizedBox(height: 20,),

                ListOrderSection()


              ],
            ),
          ),
        ),
      )
    );
  }
}









