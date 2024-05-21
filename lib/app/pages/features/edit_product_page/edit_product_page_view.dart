import 'package:ayamku_admin/app/pages/features/add_product_page/section/product_page.dart';
import 'package:ayamku_admin/app/pages/features/edit_product_page/edit_product_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_bottom.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProductPageView extends GetView<EditProductPageController> {
  const EditProductPageView({Key? key}) : super(key: key);

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
                    Obx(
                          () => ProductPage(
                        categories: controller.categories,
                        selectedCategory: controller.selectedCategory.value,
                        onCategoryChanged: (value) => controller.onChangeCategory(value!),
                        nameController: controller.nameController,
                        priceController: controller.priceController,
                        qtyController: controller.qtyController,
                        selectedImagePath: controller.selectedImagePath.value,
                        descriptionController: controller.descriptionController,
                        hintTxtName: "PAHE Geprek",
                        hintTxtPrice: "Rp. 13.000",
                        hintTxtQty: "3",
                        hintTxtDesc: "Ayam goreng dengan saus mozarella",
                        imageController: () {
                          controller.pickImage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CommonBottom(
              onPressed1: () {
                Get.back();
              },
              onPressed2: () {
                controller.updateProduct();
              },
              bgColor1: red,
              bgColor2: primaryColor,
              ic1: icCancel,
              ic2: icEdit,
              txtColor1: Colors.white,
              txtColor2: blackColor,
              txt1: 'Hapus Menu',
              txt2: 'Edit Menu',
            ),
          )
        ],
      ),
    );
  }
}