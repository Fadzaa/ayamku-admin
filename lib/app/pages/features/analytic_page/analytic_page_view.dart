import 'package:ayamku_admin/app/pages/features/analytic_page/analytic_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/analytic_page/section/sales_statistic.dart';
import 'package:ayamku_admin/app/pages/features/analytic_page/section/sales_summary_section.dart';
import 'package:ayamku_admin/app/pages/features/home_page/sections/sales_summary_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AnalyticPageView extends GetView<AnalyticPageController>{
  const AnalyticPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                "Analytic",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              )
            ],
          )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: baseColor,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SalesSummarySection(specialPage: true),

                const SizedBox(height: 20),

                Obx(() => controller.isLoading.value ? Center(child: commonLoading(),) : SalesStatisitc())

              ],
            ),
          ),
        ),
      ),
    );
  }
}