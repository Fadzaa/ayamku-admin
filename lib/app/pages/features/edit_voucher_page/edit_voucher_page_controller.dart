import 'package:ayamku_admin/app/api/voucher/model/voucher_response.dart';
import 'package:ayamku_admin/app/api/voucher/voucher_service.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:dio/dio.dart' as dio;
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
        "qty" : int.parse(qtyController.text),
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
        print(e);
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