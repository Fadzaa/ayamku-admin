import 'package:ayamku_admin/app/pages/features/add_promo_page/section/promo_page.dart';
import 'package:ayamku_admin/app/pages/features/edit_promo_page/edit_promo_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_bottom.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditPromoPageView extends GetView<EditPromoPageControlller>{
  const EditPromoPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
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
              "Edit promo",
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
                Obx(() => PromoPage(
                  selectedImagePath: controller.selectedImagePath.value,
                  imageController: () {
                    controller.pickImage();
                  },

                  nameController: controller.nameController,
                  eventController: controller.eventController,
                  discountController: controller.discountController,
                  startDateController: controller.startDateController,
                  endDateController: controller.endDateController,
                  onTapStartDate: () => controller.selectDate(context, controller.startDateController),
                  onTapEndDate: () => controller.selectDate(context, controller.endDateController),
                )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CommonBottom(
        onPressed1: () => controller.deletePromo() ,
        onPressed2: () => controller.updatePromo(),
        bgColor1: red,
        bgColor2: primaryColor,
        ic1: icCancel,
        ic2: icEdit,
        txtColor1: Colors.white,
        txtColor2: blackColor,
        txt1: 'Hapus',
        txt2: 'Edit',
      ),
    );
  }

}