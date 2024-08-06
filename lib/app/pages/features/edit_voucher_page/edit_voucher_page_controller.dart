import 'package:ayamku_admin/app/api/voucher/model/voucher_response.dart';
import 'package:ayamku_admin/app/api/voucher/voucher_service.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
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
  RxBool isLoading = false.obs;

  final voucher = Get.arguments;
  RxList<Voucher> voucherList = <Voucher>[].obs;
  VoucherService voucherService = VoucherService();
  VoucherResponse voucherResponse = VoucherResponse();


  void selectDate (
      BuildContext context, TextEditingController controller) async {
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


  Future <void> updateVoucher() async {
    try {
      isLoading(true);

      await voucherService.updateVoucher(
          voucher.id.toString(),
          codeController.text,
          int.parse(discountController.text.toString(),),
          descriptionController.text,
          startDateController.text,
          endDateController.text
      );


      Get.snackbar(
        "Success",
        "Voucher updated successfully",
      );

      Get.offNamedUntil(Routes.MANAGEMENT_VOUCHER, (routes) => routes.settings.name == Routes.HOME_PAGE);



    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );

    } finally {
      isLoading.value = false;
    }
  }

  void deleteVoucher() async {
    try {
      isLoading(true);

      await voucherService.deleteVoucher(voucher.id.toString());

      Get.snackbar(
        "Success",
        "Voucher deleted successfully",
      );

      Get.offNamedUntil(Routes.MANAGEMENT_VOUCHER, (routes) => routes.settings.name == Routes.HOME_PAGE);
    }catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
}
}
