import 'dart:ffi';

import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/api/order/order_service.dart';
import 'package:ayamku_admin/app/api/sales-summary/sales_model.dart';
import 'package:ayamku_admin/app/api/sales-summary/sales_service.dart';
import 'package:ayamku_admin/app/api/store/model/storeResponse.dart';
import 'package:ayamku_admin/app/api/store/store_service.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class HomePageController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  RxInt numberOfDeliveryOrders = 0.obs;
  RxInt numberOfPickupOrders = 0.obs;
  RxInt numberOfAllOrders = 0.obs;
  final isActive = false.obs;

  RxString dropdownValue = "Hari ini".obs;

  RxInt numberOfOrders = 0.obs;
  RxInt processingOrdersCount = 0.obs;

  late StoreService storeService;
  late Store storeResponse;
  RxBool isLoading = false.obs;
  RxBool isLoadingSales = false.obs;

  RxList<Order> listLatestOrder = <Order>[].obs;
  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  SalesResponse salesResponse = SalesResponse();
  SalesService salesService = SalesService();

  RxString selectedFilterTypeOrder = 'today'.obs;

  void updateSelectedType(String type) {
    selectedFilterTypeOrder.value = type;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    storeService = StoreService();

    getLatestOrder(null);
    print("Check Current latest order");

    getSalesSummary('today');

    getStatusStore();
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

      getStatusStore();

      Get.snackbar(
        "Sukses",
        "Store status berhasil di update value",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );

      print("Status: ${store.storeStatus}");
    } catch (e) {
      Get.snackbar("Update failed", "Failed to update store: $e");
      print("Error updating store: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getStatusStore() async {
    try {
      final response = await storeService.getStatusStore();
      Store store = Store.fromJson(response.data);

      if (store.storeStatus == 0) {
        isActive.value = false;
      } else if (store.storeStatus == 1) {
        isActive.value = true;
      }


    } catch (e) {
      Get.snackbar("Update failed", "Failed to update store: $e");
      print("Error updating store: $e");
    }
  }

  Future<void> getSalesSummary(String filter) async {
    try {
      isLoadingSales.value = true;

      final response = await salesService.getSaleSummary(filter);
      salesResponse = SalesResponse.fromJson(response.data);

    } catch (e) {
      isLoadingSales.value = true;
      print(e);
    } finally {
      isLoadingSales.value = false;
    }
  }

  void onChangeValue(String selectDay, List<String> items) {
    dropdownValue.value = selectDay;
    items.remove(selectDay);
    items.insert(0, selectDay);

    String filter;
    switch (selectDay) {
      case "Hari ini":
        filter = "today";
        break;
      case "7 Hari yang lalu":
        filter = "week";
        break;
      case "1 Bulan yang lalu":
        filter = "month";
        break;
      default:
        filter = "today";
        break;
    }

    getSalesSummary(filter);
  }

  Future getLatestOrder(String? method) async {
    try {
      isLoading.value = true;

      print("Check pre latest order");

      final response = await orderService.getOrderLatest(method);
      listLatestOrder.clear();

      orderResponse = OrderResponse.fromJson(response.data);
      listLatestOrder.value = orderResponse.data!;

      print("Check latest order");
      print(listLatestOrder.length);


    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }


  void toggleSwitch(bool value) {
    if (isActive.value == false && value == false) {
      Get.snackbar("Store Status", "The store is already closed and cannot be closed again.");
      return;
    }

    if (isActive.value == false && value == true) {
      isActive.value = true; // Automatically open the store if it was closed
      updateStore();
    } else {
      isActive.value = value;
      updateStore();
    }
  }

  void changeIndex(int index) async {
    currentIndex.value = index;
    switch (index) {
      case 0:
        await getLatestOrder(null);
        break;
      case 1:
        await getLatestOrder("on_delivery");
        break;
      case 2:
        await getLatestOrder('pickup');
        break;
    }
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

}