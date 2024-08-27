import 'dart:async';

import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/api/order/order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderPageController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxInt numberOfOrders = 0.obs;
  RxInt numberOfDeliveryOrders = 0.obs;
  RxInt numberOfPickupOrders = 0.obs;
  RxString selectedValue = 'all'.obs;
  RxString selectedFilterTypeOrder = 'Semua'.obs;
  RxString selectedStatusDisplay = 'Semua'.obs;
  RxString selectedStatus = 'Semua'.obs;

  // fetch order
  RxList<Order> listOrder = <Order>[].obs;
  RxList<Order> listAllOrder = <Order>[].obs;
  RxList<Order> listPickupOrder = <Order>[].obs;
  RxList<Order> listDeliveryOrder = <Order>[].obs;
  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  // status
  RxList<String> acceptedOrders = <String>[].obs;
  bool isOrderAccepted(String orderId) {
    return acceptedOrders.contains(orderId);
  }
  void acceptOrder(String orderId) {
    updateStatus(orderId, 'accept');
    acceptedOrders.add(orderId);
  }

  RxList<String> completedOrders = <String>[].obs;
  RxList<String> cancelledOrders = <String>[].obs;

  bool isOrderCancelled(String orderId) {
    return cancelledOrders.contains(orderId);
  }

  void cancelOrder(String orderId) {
    updateStatus(orderId, 'cancelled');
    cancelledOrders.add(orderId);
  }

  bool isOrderCompleted(String orderId) {
    return completedOrders.contains(orderId);
  }

  void updateSelectedValue(String valueOrder) {
    selectedValue.value = valueOrder;
  }

  void selectSectionType(String method) {
    selectedFilterTypeOrder.value = method;
    if (method == 'Semua') {
      getAllOrder();
    } else {
      getOrderMethod(method);
    }
  }

  void completeOrder(String orderId) {
    updateStatus(orderId, 'completed');
    completedOrders.add(orderId);
  }


  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    getAllOrder();
    getOrderMethod('on_delivery');
    getOrderMethod('pickup');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  Future<void> getAllOrder() async {
    try {
      isLoading.value = true;

      final response = await orderService.getOrder();

      print("Fetch Semua Order");
      print(response.data);

      listAllOrder.assignAll(OrderResponse.fromJson(response.data).data!);
      listOrder.assignAll(listAllOrder);
      numberOfOrders.value = listAllOrder.length;

      print('Number of orders: ${numberOfOrders.value}');


      print(listOrder);

      print(orderResponse.data);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOrderMethod(String method) async {
    try {
      print('value method = ' + method);
      isLoading.value = true;

      final response = await orderService.getOrderLatest(method);

      orderResponse = OrderResponse.fromJson(response.data);

      if (method == 'on_delivery') {
        listDeliveryOrder.assignAll(orderResponse.data!);
        numberOfDeliveryOrders.value = listOrder.length;
      } else {
        listPickupOrder.assignAll(orderResponse.data!);
        numberOfPickupOrders.value = listPickupOrder.length;
      }

    } catch (e) {
      print('Error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateStatus(String id, String status) async {
    try {
      isLoading.value = true;

      final response = await orderService.updateOrderStatus(int.parse(id), status.toString());

      print("Update order status response: ${response.data}");


    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  static final Map<String, String> statusMapping = {
    "Dalam proses": "processing",
    "Selesai": "completed",
    "Telah Diterima": "accept",
    "Dibatalkan": "cancelled",
    "Dikonfirmasi": "order_confirm",
  };

  void updateSelectedStatus(String statusText) {
    selectedStatusDisplay.value = statusText;
    if (statusText == "Semua") {
      selectedStatus.value = ["processing", "completed", "accept", "cancelled"].join(',');
    } else {
      selectedStatus.value = statusMapping[statusText] ?? "";
    }

    applyAllFilters();
  }

  void filterByStatus(String status, String type) {
    listOrder.assignAll(listAllOrder.where((order) => order.status == status && order.methodType == type).toList());
  }

  Future<void> applyAllFilters() async {
    isLoading.value = true;
    listOrder.clear();

    try {
      await getAllOrder();

      print("Selected status: ${selectedStatus.value}");
      print("Selected filter type: ${selectedFilterTypeOrder.value}");

      if (selectedStatus.value == 'Semua' && selectedFilterTypeOrder.value == 'Semua') {
        listOrder.assignAll(listAllOrder);
      } else {
        listOrder.assignAll(listAllOrder.where((order) {
          bool statusMatch = selectedStatus.value == 'Semua' || order.status == selectedStatus.value;
          bool typeMatch = selectedFilterTypeOrder.value == 'Semua' ||
              (selectedFilterTypeOrder.value == 'OnDelivery' && order.methodType == 'on_delivery') ||
              (selectedFilterTypeOrder.value == 'Pickup' && order.methodType == 'pickup');

          print("Order: ${order.status}, ${order.methodType}");
          print("Status match: $statusMatch, Type match: $typeMatch");

          return statusMatch && typeMatch;
        }).toList());
      }

      print("Filtered orders count: ${listOrder.length}");

    } catch (e) {
      print('Error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> selectTypeOrder(String type) async {
    selectedFilterTypeOrder.value = type;
    switch (type) {
      case 'Semua':
        await getAllOrder();
        break;
      case 'OnDelivery':
        await getOrderMethod('on_delivery');
        break;
      case 'Pickup':
        await getOrderMethod('pickup');
        break;
      default:
        await getAllOrder();
        break;
    }

    print(type);
  }

  Future<void> pickupFilters() async {
    isLoading.value = true;

    await getOrderMethod('pickup');

    filterByStatus(selectedStatus.value, 'pickup');

    isLoading.value = false;
  }

  Future<void> deliveryFilters() async {
    isLoading.value = true;

    await getOrderMethod('on_delivery');

    filterByStatus(selectedStatus.value, 'on_delivery');

    isLoading.value = false;
  }

  void clearFilters() {
    selectedStatus.value = 'Semua';
    selectedStatusDisplay.value = 'Semua';
    selectedFilterTypeOrder.value = 'Semua';
    getAllOrder();
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

}
