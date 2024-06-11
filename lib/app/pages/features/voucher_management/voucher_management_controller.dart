
import 'package:ayamku_admin/app/pages/features/product_page/model/product.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/model/voucher.dart';
import 'package:ayamku_admin/app/pages/features/voucher_management/model/voucher_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoucherPageController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;
  RxList<Voucher> voucherList = voucher_data;
  RxString selectedValue = 'Semua'.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  void addVoucher(Voucher voucher) {
    voucherList.add(voucher);
  }

}
