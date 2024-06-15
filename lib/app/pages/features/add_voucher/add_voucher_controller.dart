import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddVoucherPageController extends GetxController {

  final TextEditingController codeController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();




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


  // void addVoucher() {
  //   int qty = int.parse(qtyController.text);

  //   voucherPageController.addVoucher(Voucher(
  //     name: nameController.text,
  //     qty: qty,
  //     description: descriptionController.text,
  //     startDate: DateTime.parse(startDateController.text),
  //     endDate: DateTime.parse(endDateController.text),
  //   ));
  //   clearForm();
  //   Get.back();
  // }

  void clearForm() {
    codeController.clear();
    discountController.clear();
    qtyController.clear();
    descriptionController.clear();
  }

  @override
  void onClose() {
    codeController.dispose();
    discountController.dispose();
    qtyController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void onInit() {
    super.onInit();
  }
}
