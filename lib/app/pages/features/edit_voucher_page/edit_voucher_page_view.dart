import 'package:ayamku_admin/app/pages/features/edit_voucher_page/edit_voucher_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_bottom.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'section/edit_voucher_page.dart';

class EditVoucherPageView extends GetView<EditVoucherPageController> {
  EditVoucherPageView({super.key});

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
                "Edit Voucher",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              )
            ],
          )
      ),
      body: Container(
        height: screenHeight,
        color: baseColor,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
            child: SingleChildScrollView(
                child: EditVoucherPage()
            )
        ),
      ),
      bottomNavigationBar:CommonBottom(
        onPressed1: () {
          Get.back();
        },
        onPressed2: () {
          controller.updateVoucher();
        },
        bgColor1: red,
        bgColor2: primaryColor,
        ic1: icCancel,
        ic2: icUpload,
        txtColor1: Colors.white,
        txtColor2: blackColor,
        txt1: 'Batalkan',
        txt2: 'Upload Voucher',
      ) ,
    );
  }
}
