import 'package:ayamku_admin/app/api/voucher/model/voucher_response.dart';
import 'package:ayamku_admin/app/api/voucher/voucher_service.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditVoucherPageController extends GetxController {
  final VoucherPageController controller = Get.find();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final Voucher voucher = Get.arguments;
  RxList<Voucher> voucherList = <Voucher>[].obs;
  VoucherService voucherService = VoucherService();
  VoucherResponse voucherResponse = VoucherResponse();


  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd MMMM yyyy').format(picked);
      controller.text = formattedDate;
    }

    print(picked);
  }

  @override
  void onInit() {
    super.onInit();
    codeController.text = voucher.code!;
    discountController.text = voucher.discount.toString();
    qtyController.text = voucher.qty.toString();
    descriptionController.text = voucher.description!;
    startDateController.text = voucher.startDate!;
    endDateController.text = voucher.endDate!;
  }

  void updateVoucher() async {
    try {
      final formData = {
        "code": codeController.text,
        "discount": discountController.text,
        "qty": qtyController.text,
        "description": descriptionController.text,
        "start_date": startDateController.text,
        "end_date": endDateController.text,
      };

      final response = await voucherService.updateVoucher(voucher.id.toString(), formData);
      voucherResponse = VoucherResponse.fromJson(response.data);

      if (voucherResponse.data != null) {
        Get.snackbar(
          "Success",
          "Voucher updated successfully",
        );

        print('Updated voucher data: ${voucherResponse.data}');
        controller.getAllVoucher();
      } else {
        Get.snackbar(
          "Failed",
          "Failed to update voucher",
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }


}