import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_all_order_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_all_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderSection extends GetView<OrderPageController> {
  String displayTime() {
    int currentHour = DateTime.now().hour;
    DateTime now = DateTime.now();

    if (currentHour >= 10 && currentHour < 12) {
      return DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, 12, 0));
    } else if (currentHour >= 7 && currentHour < 10) {
      return DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, 9, 40));
    } else {
      return "Selesai";
    }
  }



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



  final String methodType;
  final Widget header;

  const OrderSection({required this.methodType, required this.header, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.isLoading.value){
        return Center(
          child: commonLoading(),
        );
      } else {
        String currentShift = displayTime();
        return SingleChildScrollView(
          child: Column(
            children: [
              header,
              SizedBox(height: 20,),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.listOrder.isEmpty) {
                  return NotFoundPage(
                    image: notFound,
                    title: 'Data tidak ditemukan',
                    subtitle: 'Silahkan cari data lainnya',
                  );
                }

                List<Order> filteredOrders = controller.listOrder.where((order) {
                  if (methodType == 'on_delivery') {
                    return order.shiftDelivery == currentShift;
                  }
                  // For other methods, like 'pickup', you can add specific conditions as well
                  return true;
                }).toList();

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          if (methodType == 'Semua') {
                            controller.getAllOrder();
                          } else {
                            controller.getOrderMethod(methodType);
                          }
                        },
                        child: ListView.builder(
                          // itemCount: controller.listOrder.length,
                          itemCount:filteredOrders.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final order = filteredOrders[index];
                            if (methodType == 'Semua' || order.methodType == methodType) {
                              return ItemAllOrderVertical(
                                profileUser: order.user!.profilePicture ?? "https://i.imgflip.com/6yvpkj.jpg",
                                id: order.id.toString(),
                                status: order.status.toString(),
                                cartItems: order.cart!.cartItems!,
                                namePos: order.post!.name!.toString(),
                                orderName: order.id.toString(),
                                orderTime: DateFormat('dd MMMM yyyy').format(DateTime.parse(order.createdAt.toString())),
                                username: order.user!.name!,
                                  sessionOrder: order.methodType == 'on_delivery'
                              ? order.shiftDelivery
                                  : formatPickupTime(order.pickupTime.toString(),) ,
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
                                method: order.methodType!,
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        );
      }
    });
  }
}


