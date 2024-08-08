import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/api/order/order_history_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HistoryPageController extends GetxController with SingleGetTickerProviderMixin {

  TabController? tabController;
  OrderHistoryService orderHistoryService = OrderHistoryService();
  OrderResponse orderResponse = OrderResponse();
  
  RxList<Order> listOrderPickup = <Order>[].obs;
  RxList<Order> listOrderDelivery = <Order>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this );
    
    // getOrderHistory();
  }
  
  // Future<void> getOrderHistory() async {
  //   try {
  //     isLoading.value = true;
  //
  //     final response = await orderHistoryService.getOrderMethodType('on_delivery');
  //
  //     print("CHECK RESPONSE DATA");
  //     print(response.data);
  //
  //     orderResponse = OrderResponse.fromJson(response.data);
  //     listOrder = orderResponse.data!.obs;
  //
  //     print(listOrder);
  //
  //
  //   } catch (e) {
  //     isLoading.value = true;
  //     print(e);
  //   } finally {
  //     isLoading.value = false;
  //   }
  //
  // }
  //
  // Future<void> getOrderHistory() async {
  //   try {
  //     isLoading.value = true;
  //
  //     final response = await orderHistoryService.getOrderMethodType('on_delivery');
  //
  //     print("CHECK RESPONSE DATA");
  //     print(response.data);
  //
  //     orderResponse = OrderResponse.fromJson(response.data);
  //     listOrder = orderResponse.data!.obs;
  //
  //     print(listOrder);
  //
  //
  //   } catch (e) {
  //     isLoading.value = true;
  //     print(e);
  //   } finally {
  //     isLoading.value = false;
  //   }
  //
  // }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

}