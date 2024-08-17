import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:get/get.dart';
import 'order_summary.dart';

final controller = Get.put(OrderPageController());
final List <OrderSummary> order_summary_data = [

  OrderSummary(
      icon: icTotalOrder,
      title: "Total Order",
      count: "${controller.numberOfOrders.value}"
  ),
  OrderSummary(
      icon: icHistory,
      title: "History Order",
      count: "148"
  ),
  OrderSummary(
      icon: icTotalPickup,
      title: "Total Pickup",
      count: "${controller.numberOfPickupOrders.value}",
  ),
  OrderSummary(
      icon: icTotalDelivery,
      title: "Total Delivery",
      count: "${controller.numberOfDeliveryOrders.value}"
  ),
  // OrderSummary(
  //     icon: icCancel,
  //     title: "Canceled",
  //     count: 3
  // ),


];