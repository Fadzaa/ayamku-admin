import 'package:ayamku_admin/app/pages/features/voucher_management/items/item_voucher_vertical.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/model/option_data.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

voidGiftVoucher(BuildContext context, int voucherId) {
  final controller = Get.put(VoucherPageController());
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 230,
            padding: EdgeInsets.only(left: 15,right: 15,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Gift Voucher", style: txtHeadline3),
                    Image.asset(icVoucherOutline)
                  ],
                ),

                Divider(color: blackColor50,),

                SizedBox(height: 15,),

                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: option_data.length,
                    itemBuilder: (context, index) =>
                        Column(
                          children: [
                            OptionGiftVoucher(
                              name: option_data[index].name,
                              value: option_data[index].value,
                            ),
                          ],
                        )
                ),

                SizedBox(height: 15,),

                CommonButton(
                    height: 45,
                    text: "Lanjutkan",
                    onPressed: (){
                      controller.optionGift(voucherId);
                    }
                )
              ],
            ),
          )
      )
  );
}

class OptionGiftVoucher extends GetView<VoucherPageController> {
  const OptionGiftVoucher({
    super.key,
    required this.name,
    required this.value,

  });

  final String name, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Obx(() => InkWell(
            onTap: () => controller.selectedRadio(value),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: controller.selectedGiftVoucherType.value == value
                      ? primaryColor
                      : Colors.grey,
                ),
                color: Colors.transparent,
              ),
              child: controller.selectedGiftVoucherType.value == value
                  ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  icActiveRadioButton,
                  width: 10,
                  height: 10,
                ),
              )
                  : null,
            ),
          )
          ),

          SizedBox(width: 10,),

          Text(name, style: txtBody),
        ],
      ),
    );
  }
}