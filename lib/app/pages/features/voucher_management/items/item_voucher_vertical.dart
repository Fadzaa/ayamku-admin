import 'dart:ffi';
import 'package:dotted_line/dotted_line.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/bottomSheet/gift_voucher.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/bottomSheet/menu_voucher.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/model/option_data.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';

class ItemVoucherVertical extends GetView<VoucherPageController> {
  const ItemVoucherVertical({
    super.key,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.stock,
    required this.discount,
    required this.onPressed,
  });

  final String name, startDate, endDate, stock, discount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoucherPageController());
    
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                     Text(name,style: txtHeadline3,),

                    SizedBox(height: 10),

                    Row(
                      children: [

                        Text(startDate),

                        SizedBox(width: 10),

                        Text("-"),

                        SizedBox(width: 10),

                        Text(endDate),
                      ],
                    ),



                  ],
                ),

                Text("$discount %" ,style: txtFormTitle.copyWith(color: blackColor50),),
                // InkWell(
                //     onTap: () => voidMenuVoucher(context, name,startDate,endDate,discount, stock),
                //     child: SvgPicture.asset(icMenu)
                // ),

              ],
            ),

            SizedBox( height: 15,),

            DottedLine(
              dashLength: 15,
              dashGapLength: 5,
              lineThickness: 2,
              dashColor: grey,
            ),

            SizedBox( height: 15,),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("qty : $stock",style: txtBody.copyWith(color: blackColor50),),

                CommonButtonOutline(
                  width: 122,
                  height: 5,
                  text: 'Gift voucher',
                  style: txtCaption.copyWith(color: primaryColor),
                  onPressed: () => voidGiftVoucher(context),
                  borderColor: primaryColor,
                  color: primaryColor,
                )
              ],
            ),

            // Divider(),
          ],
        ),
      ),
    );
  }
}







