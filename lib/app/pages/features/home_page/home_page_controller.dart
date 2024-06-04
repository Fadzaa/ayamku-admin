import 'package:ayamku_admin/app/api/store/model/storeResponse.dart';
import 'package:ayamku_admin/app/api/store/store_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePageController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  final isActive = false.obs;

  late StoreService storeService;
  late Store storeResponse;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    storeService = StoreService();
    updateStore();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  Future<void> updateStore() async {
    try {
      isLoading(true);

      final response = await storeService.updateStore();
      Store store = Store.fromJson(response.data);
      print("Message: ${store.message}");

    } catch (e) {
      Get.snackbar("Update failed", "Failed to update store: $e");
      print("Error updating store: $e");
    } finally {
      print("Succes update");
      isLoading(false);
    }
  }

  void toggleSwitch(bool value) {
    isActive.value = value;
    updateStore();
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

}