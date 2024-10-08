import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/section/header_status_section.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/section/delivery_section.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/section/detail_order_summary.dart';
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
    final argument = Get.arguments;
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  icBack,
                ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.orderStatus.value == "confirmed_order") HeaderStatusSection(),
              DeliverySection(
                profileUser: controller.profileUser.value ?? "https://i.imgflip.com/6yvpkj.jpg",
                date: controller.date.value,
                status: controller.orderStatus.value,
                idOrder: controller.orderId.value,
                userName: controller.userName.value,
                posName: controller.methodType.value == 'pickup'
                    ? "ambil di outlet"
                    : controller.postName.value,
                posDesc: controller.methodType.value == 'pickup'
                    ? null
                    : controller.postDesc.value,
              ),
          

              DetailOrderSummary(orderId: controller.orderId.value,),
              // if (controller.orderStatus.value == "confirm_order") PenilaianSection(),


            ],
          ),
        ),
      ),
    );
  }
}
