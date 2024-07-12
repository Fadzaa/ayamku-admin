import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_delivery_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_pickup_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_schedule_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/product_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestOrderSection extends GetView<HomePageController> {
  LatestOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listMethod = [
      "On Delivery",
      "Pickup",
      // "Terjadwal"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Latest Order", style: txtHeadline3),
            // ItemDropdownDay() => ak ga inget ni isinya apa aja, tp better di ilangin gas
          ],
        ),

        const SizedBox(height: 20,),

        SizedBox(
          height: 30,
          child: ListView.builder(
              itemCount: listMethod.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  Obx(() => ChipOrder(
                      text: listMethod[index],
                      totalOrder: 2,
                      index: index,
                      isSelected: controller.currentIndex.value == index
                  ))
          ),
        ),

        const SizedBox(height: 20,),

        Obx(() {
          if (controller.isLoading.value){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (controller.currentIndex.value == 0) {
            return ListView.builder(
                itemCount: controller.listOrder.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
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
          } else if (controller.currentIndex.value == 1){
            return ListView.builder(
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
          // } else if (controller.currentIndex.value == 2) {
          //   return ListView.builder(
          //     itemCount: 2,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemBuilder: (context, index) => ItemScheduleVertical(
          //       orderName: "PAHE GEPREK",
          //       orderPrice: 20000,
          //       orderStatus: ScheduleStatus.done,
          //       orderTime: DateTime.now(),
          //       username: "Fattah Anggit",
          //     ),
          //   );
          } else {
            return Container();
          }
        }),
      ],
    );
  }
}

class ChipOrder extends GetView<HomePageController> {
  const ChipOrder(
      {super.key,
      required this.text,
      required this.totalOrder,
      required this.isSelected,
      required this.index});

  final String text;
  final int totalOrder, index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => controller.changeIndex(index),
      child: Container(
          height: 40,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: isSelected
                  ? null
                  : Border.all(color: blackColor50, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: txtCaption.copyWith(color: Colors.black),
              ),
              const SizedBox(
                width: 5,
              ),
              totalOrder > 0 && isSelected
                  ? Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          totalOrder.toString(),
                          style: txtCaption.copyWith(color: Colors.black),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          )),
    );
  }
}
