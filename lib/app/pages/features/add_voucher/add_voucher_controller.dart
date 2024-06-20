import 'package:ayamku_admin/app/api/voucher/model/voucher_response.dart';
import 'package:ayamku_admin/app/api/voucher/voucher_service.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';

class AddVoucherPageController extends GetxController {

  final controller = Get.put(VoucherPageController());

  final TextEditingController codeController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  RxList<Voucher> voucherList = <Voucher>[].obs;
  VoucherService voucherService = VoucherService();
  VoucherResponse voucherResponse = VoucherResponse();


  RxBool isLoading = false.obs;

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


  Future addVoucher() async{
    try {
      isLoading.value = true;
      dio.FormData formData = dio.FormData.fromMap({
        "code" : codeController.text,
        "discount" : int.parse(discountController.text),
        "qty" : int.parse(qtyController.text),
        "description" : descriptionController.text,
        "start_date" : startDateController.text,
        "end_date" : endDateController.text
      });

      final response = await voucherService.addVoucher(formData);
      voucherResponse = VoucherResponse.fromJson(response.data);

      Voucher voucher = Voucher(
          code: codeController.text,
          discount: int.parse(discountController.text),
          qty: int.parse(qtyController.text),
          description: descriptionController.text,
          startDate: startDateController.text,
          endDate: endDateController.text
      );

      controller.voucherList.add(voucher);

      update();

      Get.toNamed(Routes.MANAGEMENT_VOUCHER);
      Get.snackbar("Tambah voucher Sukses", "Berhasil menambahkan voucher!");

      if (voucherResponse.data != null) {
        Get.snackbar(
          "Success",
          "Voucher added successfully",
        );

        print('Add voucher data: ${voucherResponse.data}');
        controller.getAllVoucher();
      } else {
        Get.snackbar(
          "Failed",
          "Failed to add voucher",
        );
      }
    }
    catch(e){
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

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
