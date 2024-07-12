import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_all_order_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_delivery_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_all_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllOrderSection extends GetView<OrderPageController> {
  const AllOrderSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Text("List All Order", style: txtHeadline3),

            Spacer(),

            InkWell(
              onTap: () => voidFilterAllOrder(context),
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
          }

          return ListView.builder(
              itemCount: controller.listAllOrder.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                final order = controller.listAllOrder[index];
                return ItemAllOrderVertical(
                    cartItems: order.cart!.cartItems!,
                    namePos: order.post!.id!.toString(),
                    orderName: order.id.toString(),
                    orderTime: DateTime.now(),
                    username: order.user!.name!,
                    onTap: () {  },
                    method: order.methodType!
                );
              }
          );
        })


      ],
    );
  }
}


