import 'package:ayamku_admin/common/constant.dart';
import 'order_summary.dart';

final List <OrderSummary> order_summary_data = [
  OrderSummary(
      icon: icTotalOrder,
      title: "Total Order",
      count: 150
  ),
  OrderSummary(
      icon: icTotalPickup,
      title: "Total Pickup",
      count: 2
  ),
  OrderSummary(
      icon: icTotalDelivery,
      title: "Total Delivery",
      count: 148
  ),
  OrderSummary(
      icon: icCancel,
      title: "Canceled",
      count: 3
  ),


];