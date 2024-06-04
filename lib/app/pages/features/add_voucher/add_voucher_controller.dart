import 'package:ayamku_admin/app/pages/features/product_page/model/product.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/model/voucher_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../voucher_management/model/voucher.dart';
import '../voucher_management/voucher_management_controller.dart';

class AddVoucherPageController extends GetxController {

  // final VoucherPageController voucherPageController = Get.put(VoucherPageController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
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
    nameController.clear();
    priceController.clear();
    qtyController.clear();
    descriptionController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    qtyController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void onInit() {
    super.onInit();
  }
}
