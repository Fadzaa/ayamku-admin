import 'package:ayamku_admin/app/pages/features/order_page/items/item_delivery_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_all_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_delivery_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/pickup_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DeliveryOrderSection extends GetView<OrderPageController> {
  const DeliveryOrderSection({super.key});

  String displayTime() {
    int currentHour = DateTime.now().hour;
    if (currentHour >= 10 && currentHour < 12) {
      return "12.00";
    } else if (currentHour >= 7 && currentHour < 9) {
      return "09.40";
    } else {
      return "Selesai";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(displayTime(), style: txtCaption)),
          SizedBox(
            width: 10,
          ),
          Text("List Delivery Order", style: txtHeadline3),
          Spacer(),
          InkWell(
              onTap: () => voidDeliveryOrder(context),
              child: SvgPicture.asset(icFilter))
        ]),

        const SizedBox(
          height: 20,
        ),

        displayTime() == "Selesai"

        ? Center(
          child: NotFoundPage(
            image: sessionOrderOver,
            title: 'Order Session Over',
            subtitle: 'Sesi order delivery sudah selesai, silahkan cek untuk pemesanan pickup',
            commonButton: CommonButton(
              onPressed: (){
                controller.selectSectionType('pickup');
              },
              text: 'Pickup',
            )
          ),)

        :
        Obx(() {
          if(controller.isLoading.value){
            return Center(
              child: CircularProgressIndicator(),
            );
          } return ListView.builder(
              itemCount: controller.listOrder.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                final order = controller.listOrder[index];
                return ItemDeliveryVertical(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_ORDER_PAGE,
                      arguments: {
                        'cartItems': order!.cart!.cartItems,
                        'orderId': order.id,
                        'userName': order.user!.name,
                        'postName': order.post!.name,
                        'postDesc': order.post!.description,
                        'orderStatus': order.status,
                        'methodType' : order.methodType
                      },
                    );
                  },
                  cartItems: order.cart!.cartItems!,
                  namePos: order.post!.id!.toString(),
                  orderName: order.id.toString(),
                  orderStatus: OrderStatus.done,
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
