
import 'package:ayamku_admin/app/api/voucher/model/voucher_response.dart';
import 'package:ayamku_admin/app/api/voucher/voucher_service.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class VoucherPageController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabController;

  RxString selectedValue = 'Semua'.obs;
  RxBool isLoading = false.obs;

  RxList<Voucher> voucherList = <Voucher>[].obs;
  VoucherService voucherService = VoucherService();
  VoucherResponse voucherResponse = VoucherResponse();

  final RxString value = "user".obs;
  RxString get optionType => value;

  DateTimeRange? selectedDateRange;

  void setOption(String option) {
    value.value = option;
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    if (value != "Masukkan tanggal") {
      selectedDateRange = null;
    }
    getAllVoucher();
  }

  void updateDateRange(DateTimeRange? dateRange) {
    selectedDateRange = dateRange;
    selectedValue.value = "Masukkan tanggal";
    getAllVoucher();
  }


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getAllVoucher();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  void getAllVoucher() async {
    try {
      isLoading.value = true;
      final response = await voucherService.getAllVoucher();
      voucherResponse = VoucherResponse.fromJson(response.data);
      var vouchers = voucherResponse.data!;

      if (selectedDateRange != null) {
        final start = selectedDateRange!.start;
        final end = selectedDateRange!.end;
        vouchers = vouchers.where((voucher) {
          final startDate = DateTime.parse(voucher.startDate.toString());
          final endDate = DateTime.parse(voucher.endDate.toString());
          return (startDate.isBefore(end.add(Duration(days: 1))) && endDate.isAfter(start.subtract(Duration(days: 1))));
        }).toList();
      }

      voucherList.assignAll(vouchers);
      // voucherList = vouchers.obs;
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void optionGift() {
    if (optionType.value == "user") {
      Get.toNamed(Routes.OPTION_USER);
    } else if (optionType.value == "massal") {
    }
  }
}
