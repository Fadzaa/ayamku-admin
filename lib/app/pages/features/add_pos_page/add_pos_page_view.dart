import 'package:ayamku_admin/app/pages/features/add_pos_page/add_pos_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/add_pos_page/section/add_pos_page_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_bottom.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddPosPageView extends GetView<AddPosPageController> {
  const AddPosPageView({super.key});

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
                "Tambah pos",
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
                  child: AddPosPageSection(),
                )
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CommonBottom(
              onPressed1: () {

              },
              onPressed2: () {

              },
              bgColor1: red,
              bgColor2: primaryColor,
              ic1: icCancel,
              ic2: icUpload,
              txtColor1: Colors.white,
              txtColor2: blackColor,
              txt1: 'Batalkan',
              txt2: 'Tambah pos',
            ),
          )
        ],
      ),
    );
  }
}
