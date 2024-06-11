import 'package:ayamku_admin/app/pages/features/promo-page/items/item_promo.dart';
import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PromoPageView extends GetView<PromoPageController> {
  const PromoPageView({super.key});

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
                "Promo",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              )
            ],
          )
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            color: baseColor,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    CommonSearch(text: "Search"),

                    SizedBox(height: 15,),

                    ItemPromoSection()
                  ],
                ),
              ),
            ),
          ),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: baseColor,
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: CommonButton(
                  text: '+ Tambahkan promo baru',
                  onPressed: () {
                    Get.toNamed(Routes.ADD_PROMO_PAGE);
                  },
                ),
              )
          )
        ],
      ),

    );
  }

}
