import 'package:ayamku_admin/app/pages/features/add_product_page/add_product_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/section/add_product_page.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/section/product_page.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../global_component/common_bottom.dart';

class AddProductPageView extends GetView<AddProductPageController> {
  const AddProductPageView({super.key});



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
                "Tambah produk",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AddProductPage()
                ],
              ),
            )
        ),
      ),
      bottomNavigationBar: CommonBottom(
        onPressed1: () {
          Get.back();
        },
        onPressed2: () {
          controller.addProduct();
        },
        bgColor1: red,
        bgColor2: primaryColor,
        ic1: icCancel,
        ic2: icUpload,
        txtColor1: Colors.white,
        txtColor2: blackColor,
        txt1: 'Batalkan',
        txt2: 'Tambah',
      ),
    );
  }
}