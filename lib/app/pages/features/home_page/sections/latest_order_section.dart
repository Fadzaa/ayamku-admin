import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_all_order_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_delivery_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_pickup_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_schedule_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class LatestOrderSection extends GetView<HomePageController> {
  LatestOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listMethod = [
      "Semua",
      "On Delivery",
      "Pickup",
    ];

    String formatPickupTime(String time) {
      if (time.isEmpty) {
        return "Waktu tidak tersedia";
      }

      try {
        DateTime parsedTime = DateFormat("HH:mm:ss").parse(time);
        return DateFormat("HH.mm").format(parsedTime);
      } catch (e) {

        return "Format waktu salah";
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pesanan Terbaru", style: txtHeadline3),
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
                    totalOrder: controller.listLatestOrder.length,
                    index: index,
                    isSelected: controller.currentIndex.value == index,

                  ))
          ),
        ),

        const SizedBox(height: 20,),

        Obx(() {
          if (controller.isLoading.value){
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ItemAllOrderVerticalShimmer();
                  }
              ),
            );
          }
          else if (controller.listLatestOrder.isEmpty){
            return Center(
                child: NotFoundPage(
                  image: notFound,
                  title: 'Belum ada order',
                  subtitle: 'Tunggu order terbaru.',
                ));
          }
          else if (controller.currentIndex.value == 0) {
            return ListView.builder(
                itemCount: controller.listLatestOrder.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final order = controller.listLatestOrder[index];
                  return ItemAllOrderVertical(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_ORDER_PAGE,
                        arguments: {
                          'profileUser': order.user!.profilePicture ?? "https://i.imgflip.com/6yvpkj.jpg",
                          'cartItems': order.cart?.cartItems,
                          'orderId': order.id ??  0,
                          'userName': order.user!.name,
                          'postName': order.post!.name,
                          'postDesc': order.post!.description,
                          'orderStatus': order.status,
                          'method': order.methodType,
                          'payment' : order.paymentMethod,
                          'totalPrice': order.finalAmount,
                          'discountAmount': order.discountAmount,
                          'originalAmount': order.originalAmount,
                          'finalAmount': order.finalAmount,
                          'voucher': order.voucher,
                          'pickup_time' : formatPickupTime(order.pickupTime.toString(),),
                          'shift_delivery' : order.shiftDelivery.toString(),
                          'date': DateFormat('dd MMMM yyyy').format(DateTime.parse(order.createdAt.toString()))
                        },
                      );
                    },
                      sessionOrder: order.methodType == 'on_delivery' ? order.shiftDelivery : order.pickupTime,
                    cartItems: order.cart!.cartItems!,
                    namePos: order.post!.name!.toString(),
                    orderName: order.id.toString(),
                    orderTime: DateFormat('dd MMMM yyyy').format(DateTime.parse(order.createdAt.toString())),
                    username: order.user!.name!,
                    id: order.id.toString(),
                    method: order.methodType.toString(),
                    status: order.status.toString(),
                    profileUser: order.user!.profilePicture ?? "https://i.imgflip.com/6yvpkj.jpg",
                  );
                }
            );
          }
          else if (controller.currentIndex.value == 1){
            return ListView.builder(
                itemCount: controller.listLatestOrder.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final order = controller.listLatestOrder[index];
                  return ItemDeliveryVertical(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_ORDER_PAGE,
                        arguments: {
                          'profileUser': order.user!.profilePicture ?? "https://i.imgflip.com/6yvpkj.jpg",
                          'cartItems': order.cart?.cartItems,
                          'orderId': order.id ??  0,
                          'userName': order.user!.name,
                          'postName': order.post!.name,
                          'postDesc': order.post!.description,
                          'orderStatus': order.status,
                          'method': order.methodType,
                          'payment' : order.paymentMethod,
                          'totalPrice': order.finalAmount,
                          'discountAmount': order.discountAmount,
                          'originalAmount': order.originalAmount,
                          'finalAmount': order.finalAmount,
                          'voucher': order.voucher,
                          'pickup_time' : formatPickupTime(order.pickupTime.toString(),),
                          'shift_delivery' : order.shiftDelivery.toString(),
                          'date': DateFormat('dd MMMM yyyy').format(DateTime.parse(order.createdAt.toString()))
                        },
                      );
                    },
                    cartItems: order.cart!.cartItems!,
                    namePos: order.post!.name!.toString(),
                    orderName: order.id.toString(),
                    orderStatus: OrderStatus.done,
                    orderTime: DateFormat('dd MMMM yyyy').format(DateTime.parse(order.createdAt.toString())),
                    username: order.user!.name!,
                    orderId: order.id.toString(),
                    profileUser: order.user!.profilePicture ?? "https://i.imgflip.com/6yvpkj.jpg",
                    sessionOrder: order.pickupTime.toString() ,
                  );
                }
            );
          } else if (controller.currentIndex.value == 2){
            return ListView.builder(
                itemCount: controller.listLatestOrder.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final order = controller.listLatestOrder[index];
                  return ItemPickupVertical(
                    onPressed: () {
                      Get.toNamed(
                        Routes.DETAIL_ORDER_PAGE,
                        arguments: {
                          'profileUser': order.user!.profilePicture ?? "https://i.imgflip.com/6yvpkj.jpg",
                          'cartItems': order.cart?.cartItems,
                          'orderId': order.id ??  0,
                          'userName': order.user!.name,
                          'postName': order.post!.name,
                          'postDesc': order.post!.description,
                          'orderStatus': order.status,
                          'method': order.methodType,
                          'payment' : order.paymentMethod,
                          'totalPrice': order.finalAmount,
                          'discountAmount': order.discountAmount,
                          'originalAmount': order.originalAmount,
                          'finalAmount': order.finalAmount,
                          'voucher': order.voucher,
                          'pickup_time' : formatPickupTime(order.pickupTime.toString(),),
                          'shift_delivery' : order.shiftDelivery.toString(),
                          'date': DateFormat('dd MMMM yyyy').format(DateTime.parse(order.createdAt.toString()))
                        },
                      );
                    },

                    profileUser: order.user!.profilePicture ?? "https://i.imgflip.com/6yvpkj.jpg",
                    cartItems: order.cart!.cartItems!,
                    orderName: order.id.toString(),
                    orderStatus: PickupStatus.done,
                    orderTime: DateFormat('dd MMMM yyyy').format(DateTime.parse(order.createdAt.toString())),
                    username: order.user!.name!,
                    orderId: order.id.toString(),
                    sessionOrder: '',
                  );
                }
            );
          }
          return SizedBox.shrink(); // Default return statement
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