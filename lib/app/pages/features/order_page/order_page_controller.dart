import 'package:ayamku_admin/app/pages/features/order_page/sections/all_order_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderPageController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;
  RxInt currentIndex = 0.obs;

  RxBool isOrderAccepted = false.obs;

  void acceptOrder() {
    isOrderAccepted.value = true;
  }
  String selectedValue = 'Semua';

  void updateSelectedValue(String newValue) {
    selectedValue = newValue;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }




}