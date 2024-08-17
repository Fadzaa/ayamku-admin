import 'package:ayamku_admin/app/pages/features/review_product/review_product_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/review_product/section/star_count_section.dart';
import 'package:ayamku_admin/app/pages/features/review_product/section/user_review_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReviewProductPageView extends GetView<ReviewProductPageController> {
  const ReviewProductPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                "Review of ",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              )
            ],
          )
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        height: screenHeight,
        color: baseColor,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: commonLoading(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StarCountSection(),

                    SizedBox(height: 15,),

                    UserReviewSection(listCustomer: controller.listCustomer,)
                  ],
                ),
              );
            }
          })
        ),
      )
    );
  }
}
