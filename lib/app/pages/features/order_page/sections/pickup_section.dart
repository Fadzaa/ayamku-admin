import 'package:ayamku_admin/app/pages/features/order_page/items/filter_pickup_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_pickup_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../items/item_delivery_vertical.dart';

class PickupSection extends GetView<OrderPageController> {
  const PickupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("List Order Pickup", style: txtHeadline3),

              InkWell(
                  onTap: () => voidFilterPickupOrder(context),
                  child: SvgPicture.asset(icFilter)
              )
            ]
        ),


        const SizedBox(height: 20,),

        Obx(() {
          if (controller.isLoading.value){
            return Center(
              child: CircularProgressIndicator(),
            );
          } return ListView.builder(
              itemCount: controller.listOrder.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final order = controller.listOrder[index];
                return ItemPickupVertical(
                  onPressed: () {
                    Get.toNamed(
                      Routes.DETAIL_ORDER_PAGE,
                      arguments: {
                        'cartItems': order!.cart!.cartItems,
                        'orderId': order.id,
                        'userName': order.user!.name,
                        'orderStatus': order.status,
                        'methodType' : order.methodType
                      },
                    );
                  },
                  cartItems: order.cart!.cartItems!,
                  orderName: order.id.toString(),
                  orderStatus: PickupStatus.done,
                  orderTime: DateTime.now(),
                  username: order.user!.name!,
                );
              }

          );
        })


      ],
    );
  }
}
