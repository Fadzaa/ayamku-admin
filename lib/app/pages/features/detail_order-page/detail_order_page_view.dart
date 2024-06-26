import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/section/header_status_section.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/section/delivery_section.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/section/order_summary_section.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/section/penilaian_section.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/theme.dart';
import '../../../../common/constant.dart';
import '../../global_component/common_button.dart';

class DetailOrderPageView extends GetView<DetailOrderPageController> {
  const DetailOrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,

      appBar: AppBar(
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SvgPicture.asset(
                icBack,
                width: 15,
                height: 15,
              ),
              const SizedBox(width: 10),
              Text(
                "Detail Order",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              ),
            ],
          )),

      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderStatusSection(),
                DeliverySection(),
                OrderSummarySection(),
                PenilaianSection(),
              ],),
        ),
      ),
    );
  }
}
