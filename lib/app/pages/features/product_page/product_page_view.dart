import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/product_page/section/inventory_section.dart';
import 'package:ayamku_admin/app/pages/features/product_page/section/list_product_section.dart';
import 'package:ayamku_admin/app/pages/features/product_page/section/produk_terlaris_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductPageView extends GetView<ProductPageController> {
  const ProductPageView({super.key});

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
                "Produk",
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // InventorySection(),
                //
                // SizedBox(height: 20,),
                //
                // ProdukTerlarisSection(),

                SizedBox(height: 20,),

                ListProductSection(),

                SizedBox(height: 80,)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: baseColor,
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: CommonButton(
          text: '+ Tambahkan menu baru',
          onPressed: () {
            Get.toNamed(Routes.ADD_PRODUCT_PAGE);
          },
        ),
      ),
    );
  }
}
