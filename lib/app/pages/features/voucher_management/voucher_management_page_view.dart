import 'package:ayamku_admin/app/pages/features/voucher_management/items/item_voucher_vertical.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import '../../../router/app_pages.dart';

class VoucherManagementPage extends StatelessWidget {
  const VoucherManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),

          title: Row(
            children: [
              Text("Voucher ",style: txtTitlePage.copyWith(color: blackColor,),),

              Spacer(),

              IconButton(
                icon: Icon(Icons.tune),
                onPressed: () {
                },
              ),

            ],
          )),

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

                    CommonSearch(text: "Search"),

                    SizedBox(height: 15,),

                    ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          ItemVoucherActiveVertical(),
                    ),

                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          ItemVoucherDeactiveVertical(),
                    )
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
