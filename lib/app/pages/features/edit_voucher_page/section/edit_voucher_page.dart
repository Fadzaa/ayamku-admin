import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/app/pages/features/edit_voucher_page/edit_voucher_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditVoucherPage extends GetView<EditVoucherPageController> {
  const EditVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child : Column(
            children :[
              ItemTextField(
                text: "Kode Voucher",
                hintText: "ugugugug",
                controller: controller.codeController,
              ),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ItemTextField(
                      text: "Discount",
                      hintText: "50%",
                      controller: controller.discountController,
                    ),
                  ),

                  SizedBox(width: 20,),

                  Expanded(
                    child: ItemTextField(
                      text: "QTY",
                      hintText: "3",
                      controller: controller.qtyController,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              ItemTxtCalender(
                text: 'Start date',
                hintText: '',
                onTapSuffixIcon: () => controller.selectDate(context, controller.startDateController),
                controller:controller.startDateController,
              ),

              SizedBox(height: 15),

              ItemTxtCalender(
                text: 'End date',
                hintText: '',
                onTapSuffixIcon:  () => controller.selectDate(context, controller.endDateController),
                controller: controller.endDateController,
              ),

              SizedBox(height: 15),

              ItemTextField(
                text: "Deskripsi",
                hintText: "txtDescription",
                minLines: 5,
                maxLines: 6,
                controller: controller.descriptionController,
              ),
            ]
        )
    );
  }
}
