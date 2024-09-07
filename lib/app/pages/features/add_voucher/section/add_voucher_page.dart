import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/app/pages/features/add_voucher/add_voucher_controller.dart';
import 'package:ayamku_admin/common/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVoucherPage extends GetView<AddVoucherPageController> {
  const AddVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            body: Form(
              key: controller.formKey,
              child: Column(children: [
                ItemTextField(
                  text: "Kode Voucher",
                  hintText: "VOUCHERTAHUNBARU",
                  controller: controller.codeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      controller.codeError.value = 'Harap masukkan kode voucher.';
                      return controller.codeError.value;
                    }
                    controller.codeError.value = '';
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ItemTextField(
                  text: "Discount",
                  hintText: "50%",
                  controller: controller.discountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      controller.discountError.value = 'Harap masukkan diskon.';
                      return controller.discountError.value;
                    }
                    controller.discountError.value = '';
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ItemTxtCalender(
                  text: 'Start date',
                  hintText: '',
                  onTapSuffixIcon: () => controller.selectDate(
                      context, controller.startDateController),
                  controller: controller.startDateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      controller.startDateError.value =
                          'Harap masukkan tanggal mulai.';
                      return controller.startDateError.value;
                    }
                    controller.startDateError.value = '';
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ItemTxtCalender(
                  text: 'End date',
                  hintText: '',
                  onTapSuffixIcon: () => controller.selectDate(
                      context, controller.endDateController),
                  controller: controller.endDateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      controller.endDateError.value =
                          'Harap masukkan tanggal berakhir.';
                      return controller.endDateError.value;
                    }
                    controller.endDateError.value = '';
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ItemTextField(
                  text: "Deskripsi",
                  hintText: "txtDescription",
                  minLines: 5,
                  maxLines: 6,
                  controller: controller.descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      controller.descError.value =
                          'Harap masukkan deskripsi voucher.';
                      return controller.descError.value;
                    }
                    controller.descError.value = '';
                    return null;
                  },
                ),
              ]),
            ))));
  }
}
