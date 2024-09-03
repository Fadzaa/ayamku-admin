import 'package:ayamku_admin/app/pages/features/add_product_page/section/product_page.dart';
import 'package:ayamku_admin/app/pages/features/edit_product_page/edit_product_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/edit_product_page/section/edit_product_page.dart';
import 'package:ayamku_admin/app/pages/global_component/common_bottom.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../router/app_pages.dart';

class EditProductPageView extends StatelessWidget{
  EditProductPageView({Key? key}) : super(key: key);

  final controller = Get.put(EditProductPageController());

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
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                icBack,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Edit produk",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
          ],
        ),
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
                EditProductPage()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CommonBottom(
        onPressed1: () => controller.deleteProduct(),
        onPressed2: () {
          controller.updateProduct();
        },
        bgColor1: red,
        bgColor2: primaryColor,
        ic1: icCancel,
        ic2: icEdit,
        txtColor1: Colors.white,
        txtColor2: blackColor,
        txt1: 'Hapus ',
        txt2: 'Edit ',
      ),
    );
  }
}
