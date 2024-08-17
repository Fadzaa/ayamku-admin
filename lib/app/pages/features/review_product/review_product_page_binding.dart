import 'package:ayamku_admin/app/pages/features/review_product/review_product_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewProductPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReviewProductPageController>(() => ReviewProductPageController());
  }

}