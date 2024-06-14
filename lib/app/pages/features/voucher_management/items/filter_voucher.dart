import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterVoucher extends GetView<VoucherPageController> {
  const FilterVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> filter_voucher = [
      "Semua",
      "Expired",
      "Masukkan tanggal"
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
        children: List.generate(filter_voucher.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: (){
                controller.updateSelectedValue(filter_voucher[index]);
              },
              child: ChipTheme(
                data: ChipTheme.of(context).copyWith(
                  side: controller.selectedValue.value == filter_voucher[index]
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey),
                ),
                child: Chip(
                  label: Row(
                    children: [
                      Text(filter_voucher[index],
                        style: txtCaption.copyWith(color: blackColor),
                      ),
                      if (filter_voucher[index] == "Masukkan tanggal" )
                        Row(children: [
                          SizedBox(width: 5),
                          SvgPicture.asset(
                            icDown,
                          ),
                        ]),
                    ],
                  ),

                  backgroundColor: controller.selectedValue.value == filter_voucher[index] ? primaryColor : baseColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          );
        }),
      )),
    );
  }
}
