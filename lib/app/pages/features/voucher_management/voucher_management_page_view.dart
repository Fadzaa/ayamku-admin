import 'package:ayamku_admin/app/pages/features/voucher_management/items/filter_voucher.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/items/item_voucher_vertical.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import '../../../router/app_pages.dart';
import 'package:intl/intl.dart';

class VoucherManagementPage extends StatelessWidget {
  const VoucherManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoucherPageController());
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
                "Voucher",
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
                    SizedBox(height: 15,),

                    FilterVoucher(),

                    SizedBox(height: 15,),

                    CommonSearch(text: "Search"),

                    SizedBox(height: 15,),

                    Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
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
                              onPressed: () {
                                // Get.toNamed(Routes.EDIT_VOUCHER_PAGE, arguments: voucher);
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
                  text: '+ Add New Voucher',
                  onPressed: () {
                    Get.toNamed(Routes.ADD_VOUCHER_PAGE);
                  },
                ),
              ))
        ],
      ),
    );
  }
}
