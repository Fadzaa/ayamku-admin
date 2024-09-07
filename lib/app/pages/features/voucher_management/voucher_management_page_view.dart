import 'package:ayamku_admin/app/pages/features/voucher_management/items/filter_voucher.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/items/item_voucher_vertical.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:ayamku_admin/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import '../../../router/app_pages.dart';
import 'package:intl/intl.dart';

class VoucherManagementPage extends GetView<VoucherPageController> {
  const VoucherManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                children: [

                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.HOME_PAGE);
                    },
                    child: SvgPicture.asset(
                      icBack,
                      width: 30,
                      height: 30,
                    ),
                  ),

                  SizedBox(width: 10,),

                  Text(
                    "Voucher",
                    style: txtTitlePage.copyWith(
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ],
          )
      ),

      body: Container(
        height: screenHeight,
        color: baseColor,
        padding: EdgeInsets.symmetric(horizontal: 16),

        child: SafeArea(

          child: RefreshIndicator(
            onRefresh: () async {
              controller.getAllVoucher();
            },
            child: SingleChildScrollView(

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    FilterVoucher(),

                    SizedBox(height: 15,),

                    CommonSearch(text: "Cari voucher", onChanged: (newText) => controller.getSearchVoucher(newText), ),

                    SizedBox(height: 15,),

                    Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: commonLoading());
                      } else if (controller.voucherList.isEmpty) {
                        return NotFoundPage(
                            image: notFound,
                            title: "Voucher tidak ada",
                            subtitle: "Voucher yang anda inginkan tidak ditemukan, silahkan coba lagi"
                        );
                      } else {
                        return ListView.builder(
                          itemCount: controller.voucherList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final voucher = controller.voucherList[index];
                            final startDate = DateFormat('dd MMMM yyyy')
                                .format(DateTime.parse(voucher.startDate ?? ''));
                            final endDate = DateFormat('dd MMMM yyyy')
                                .format(DateTime.parse(voucher.endDate ?? ''));
                            return ItemVoucherVertical(
                              name: voucher.code.toString(),
                              startDate: startDate,
                              endDate: endDate,
                              discount: voucher.discount.toString(),
                              index: voucher.id,
                              onPressed: () {
                                Get.toNamed(Routes.EDIT_VOUCHER_PAGE, arguments: voucher);
                              },
                            );
                          },
                        );
                      }
                    })]
              ),
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
          text: '+ Tambahkan Voucher Baru',
          onPressed: () {
            Get.toNamed(Routes.ADD_VOUCHER_PAGE);
          },
        ),
      ),
    );
  }
}
