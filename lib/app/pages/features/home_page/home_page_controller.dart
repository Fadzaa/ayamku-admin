import 'dart:ffi';

import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/api/order/order_service.dart';
import 'package:ayamku_admin/app/api/sales-summary/sales_model.dart';
import 'package:ayamku_admin/app/api/sales-summary/sales_service.dart';
import 'package:ayamku_admin/app/api/store/model/storeResponse.dart';
import 'package:ayamku_admin/app/api/store/store_service.dart';
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

  RxList<Order> listOrder = <Order>[].obs;
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
    updateStore();
    getAllOrder();
    getSalesSummary(toString());
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

  Future <void> getAllOrder() async {
    try {
      isLoading.value = true;

      final fcmToken = await FirebaseMessaging.instance.getToken();
      print('FCM TOKEN');
      print(fcmToken);

      final response = await orderService.getOrder();

      print("Fetch Semua Order");
      print(response.data);

      List<Order> orders = (response.data['data'] as List)
          .map((orderData) => Order.fromJson(orderData))
          .toList();

      print('Number of orders: ${numberOfOrders.value}');

      processingOrdersCount.value = orders.where((order) => order.status == "processing").length;
      print('Number of processing orders: ${processingOrdersCount.value}');

      orderResponse = OrderResponse.fromJson(response.data);
      listOrder = orderResponse.data!.obs;

      print(listOrder);

      print(orderResponse.data);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getSalesSummary(String filter) async {
    try {
      isLoadingSales.value = true;

      final response = await salesService.getSaleSummary(filter);
      salesResponse = SalesResponse.fromJson(response.data);

      print("SALES RESPONSE:");
      print(salesResponse.totalProduct);


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

  Future getOrderMethod(String method, String status) async {
    try {
      print('value method = ' + method);
      isLoading.value = true;

      final response = await orderService.getOrderMethodType(method: method);
      listOrder.clear();

      print("CHECK RESPONSE METHOD");
      print(response.data);
      orderResponse = OrderResponse.fromJson(response.data);
      listOrder = orderResponse.data!.where((order) => order.methodType == method && order.status == status).toList().obs;

      if (method == 'on_delivery') {
        numberOfDeliveryOrders.value = listOrder.length;
      } else if (method == 'pickup') {
        numberOfPickupOrders.value = listOrder.length;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }


  void toggleSwitch(bool value) {
    isActive.value = value;
    updateStore();
  }


  void changeIndex(int index) async {
    currentIndex.value = index;
    switch (index) {
      case 0:
        await getAllOrder();
        break;
      case 1:
        await getOrderMethod('on_delivery', 'processing');
        break;
      case 2:
        await getOrderMethod('pickup', 'processing');
        break;
    }
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

}