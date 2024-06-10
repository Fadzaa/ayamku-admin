import 'package:ayamku_admin/app/pages/features/pos_page/items/item_filter.dart';
import 'package:ayamku_admin/app/pages/features/pos_page/items/item_pos.dart';
import 'package:ayamku_admin/app/pages/features/pos_page/pos_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../router/app_pages.dart';

class PosPageView extends GetView<PosPageController> {
  const PosPageView({super.key});

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
                "Pos",
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

                    ItemFilterSelectPos(),

                    SizedBox(height: 20,),

                    CommonSearch(
                        text: "Search pos",
                    ),

                    SizedBox(height: 15,),

                    ItemPos()

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
                  text: '+ Tambahkan pos baru',
                  onPressed: () {
                    Get.toNamed(Routes.ADD_POS_PAGE);
                  },
                ),
              )
          )
        ],
      ),
    );
  }
}
