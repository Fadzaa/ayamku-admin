import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/status_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ItemAllOrderVertical extends GetView<OrderPageController> {
  const ItemAllOrderVertical(
      {super.key,
        required this.username,
        required this.id,
        this.sessionOrder,
        required this.orderName,
        required this.namePos,
        required this.orderTime,
        required this.cartItems,
        required this.onTap,
        required this.method,
        required this.status});

  final String username, orderName, namePos, method, status;
  final int id;
  final String? sessionOrder;
  final String orderTime;
  final List<CartItems> cartItems;
  final VoidCallback onTap;

  Widget getStatusWidget(String status, int orderId) {
    switch (status) {
      case 'processing':
        return TerimaPesanan(orderId: orderId, status: status);
      case 'completed':
        return PesananSelesai();
      case 'confirmed_order':
        return PesananDikonfirmasi();
      case 'accept':
        return AcceptedOrder(
          orderId: orderId,
          status: status,
        );
      case 'cancelled':
        return PesananDibatalkan();
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> timeParts = sessionOrder?.split(':') ?? [];
    DateTime specificTime = DateTime(now.year, now.month, now.day, int.parse(timeParts[0]), int.parse(timeParts[1]), int.parse(timeParts[2]));
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(icPerson),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      username,
                      style: txtSecondaryTitle,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(orderTime.toString(),
                style: txtSecondaryTitle.copyWith(color: blackColor40)),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: cartItems.map((cartItem) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${cartItem.quantity!.toString()} pcs', style: txtSecondaryTitle),
                    SizedBox(width: 10),
                    Text(cartItem.productName.toString(),
                        style: txtSecondaryTitle),
                    Spacer(),
                    Text(controller.formatPrice(cartItem.totalPrice ?? 0),
                        style: txtSecondaryTitle),
                  ],
                );
              }).toList(),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 0.5,
              color: blackColor70,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  icOrder,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  method == 'pickup' ? "Akan dijemput " : "Akan diantarkan ",
                  style: txtCaption,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                      DateFormat('HH:mm').format(specificTime),
                      style: txtCaption
                  )
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            if (method != 'pickup')
             Row(
              children: [
                SvgPicture.asset(icLocation,),

                SizedBox(width: 10,),

                Text(namePos, style: txtCaption)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Obx(() {
              return Align(
                alignment: Alignment.centerRight,
                child: getStatusWidget(status, id),
              );
            }),
            SizedBox(
              height: 5,
            ),
          ])),
    );
  }
}
