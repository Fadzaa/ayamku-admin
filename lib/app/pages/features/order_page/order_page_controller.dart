import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/api/order/order_service.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/all_order_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPageController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isOrderAccepted = false.obs;
  RxInt numberOfOrders = 0.obs;
  RxString selectedValue = 'all'.obs;
  RxString selectedFilterTypeOrder = 'Semua'.obs;
  RxString selectedStatus = 'Semua'.obs;

  // fetch order
  RxList<Order> listOrder = <Order>[].obs;
  RxList<Order> listAllOrder = <Order>[].obs;
  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();


  void updateSelectedValue(String valueOrder) {
    selectedValue.value = valueOrder;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    getAllOrder();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void getAllOrder() async {
    try {
      isLoading.value = true;

      final response = await orderService.getOrder();

      print("Fetch Semua Order");
      print(response.data);

      // List<Order> orders = (response.data['data'] as List)
      //     .map((orderData) => Order.fromJson(orderData))
      //     .toList();

      listAllOrder.addAll(OrderResponse.fromJson(response.data).data!);
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

  Future getOrderMethod(String method) async {
    try {
      print('value method = ' + method);
      isLoading.value = true;

      final response = await orderService.getOrderMethodType(method: method);
      listOrder.clear();

      print("CHECK RESPONSE METHOD");
      print(response.data);

      orderResponse = OrderResponse.fromJson(response.data);
      listOrder = orderResponse.data!.where((order) => order.methodType == method).toList().obs;
      print(listOrder);

    } catch (e) {
      print('Error ecured: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void filterByStatus(String status) {
    listOrder.assignAll(listOrder.where((order) => order.status == status).toList());
  }

  Future applyAllFilters() async {
    listOrder.clear();
    isLoading.value = true;

    try {
      selectTypeOrder(selectedFilterTypeOrder.value);
      updateSelectedStatus(selectedStatus.value);
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectTypeOrder(String type) {
    selectedFilterTypeOrder.value = type;
    if (type == 'Semua') {
      getAllOrder();
    } else if (type ==  'OnDelivery'){
      getOrderMethod('on_delivery');
    } else if (type ==  'Pickup'){
      getOrderMethod('pickup');
    } else {
      getAllOrder();
    }

    print(type);
  }

  void updateSelectedStatus(String status) {
    selectedStatus.value = status;
    if (status == 'Dalam proses') {
      filterByStatus('processing');
    } else if (status == 'Selesai') {
      filterByStatus('completed');
    } else if (status == 'Telah Diterima') {
      filterByStatus('accept');
    } else if (status == 'Dibatalkan') {
      filterByStatus('cancelled');
    }
    print(status);
  }

  void pickupFilters() async {
    isLoading.value = true;

    if (selectedStatus.value != 'Semua') {
      getAllOrder();
    } else if (selectedStatus.value == 'Dalam proses') {
      filterByStatus('processing');
    } else if (selectedStatus.value == 'Selesai') {
      filterByStatus('completed');
    } else if (selectedStatus.value == 'Telah Diterima') {
      filterByStatus('accept');
    } else if (selectedStatus.value == 'Dibatalkan') {
      filterByStatus('cancelled');
    } else {
      getAllOrder();
    }

    isLoading.value = false;
  }

  void updateSelectedType(String method) {
    selectedFilterTypeOrder.value = method;
    if (method == 'Semua') {
      getAllOrder();
    } else {
      getOrderMethod(method);
    }
  }


}
