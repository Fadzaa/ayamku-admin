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
  final formKey = GlobalKey<FormState>();

  final TextEditingController codeController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  RxList<Voucher> voucherList = <Voucher>[].obs;
  VoucherService voucherService = VoucherService();
  VoucherResponse voucherResponse = VoucherResponse();

  //validator error
  final codeError = ''.obs;
  final discountError = ''.obs;
  final descError = ''.obs;
  final startDateError = ''.obs;
  final endDateError = ''.obs;


  RxBool isLoading = false.obs;

  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      controller.text = formattedDate;
    }

    print(picked);
  }


  Future <void> addVoucher() async{
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      DateTime? startDate;
      DateTime? endDate;
      try {
        startDate = DateTime.parse(startDateController.text);
        endDate = DateTime.parse(endDateController.text);
      } catch (e) {
        throw FormatException("Invalid date format. Please use YYYY-MM-DD format.");
      }

      if (endDate.isBefore(startDate)) {
        throw Exception("End date must be after start date");
      }

      dio.FormData formData = dio.FormData.fromMap({
        "code" : codeController.text,
        "discount" : int.parse(discountController.text),
        "description" : descriptionController.text,
        "start_date" : startDate.toString(),
        "end_date" : endDate.toString()
      });

      await voucherService.addVoucher(formData);

      Get.snackbar("Tambah voucher Sukses", "Berhasil menambhkan voucher!");

      Get.offNamedUntil(Routes.MANAGEMENT_VOUCHER, (routes) => routes.settings.name == Routes.HOME_PAGE);


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