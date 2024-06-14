
import 'package:ayamku_admin/app/api/voucher/model/voucher_response.dart';
import 'package:ayamku_admin/app/api/voucher/voucher_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class VoucherPageController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabController;

  RxString selectedValue = 'Semua'.obs;
  RxBool isLoading = false.obs;

  RxList<Voucher> voucherList = <Voucher>[].obs;
  VoucherService voucherService = VoucherService();
  VoucherResponse voucherResponse = VoucherResponse();

  final RxString value = "user".obs;
  RxString get optionType => value;

  void setOption(String option) {
    value.value = option;
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    getAllVoucher();

  }

  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  void getAllVoucher () async {
    try {
      isLoading.value = true;

      final response = await voucherService.getAllVoucher();

      print("Fetch Semua Voucher");
      print(response.data);

      voucherResponse = VoucherResponse.fromJson(response.data);
      voucherList = voucherResponse.data!.obs;

      print(voucherList);


      print(voucherResponse.data);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

}
