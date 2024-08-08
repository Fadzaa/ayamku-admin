import 'package:ayamku_admin/app/pages/features/order_page/items/item_all_order_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_all_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderSection extends GetView<OrderPageController> {
  final String methodType;
  final Widget header;

  const OrderSection({required this.methodType, required this.header, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    itemCount: controller.listOrder.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final order = controller.listOrder[index];
                      if (methodType == 'Semua' || order.methodType == methodType) {
                        return ItemAllOrderVertical(
                          id: order.id.toString(),
                          status: order.status.toString(),
                          cartItems: order.cart!.cartItems!,
                          namePos: order.post!.name!.toString(),
                          orderName: order.id.toString(),
                          orderTime: DateFormat('yyyy MMMM dd').format(DateTime.parse(order.createdAt.toString())),
                          username: order.user!.name!,
                          sessionOrder: order.methodType == 'on_delivery' ? order.shiftDelivery : order.pickupTime,
                          onTap: () {
                            Get.toNamed(
                              Routes.DETAIL_ORDER_PAGE,
                              arguments: {
                                'cartItems': order.cart?.cartItems,
                                'orderId': order.id.toString(),
                                'userName': order.user!.name,
                                'postName': order.post!.name,
                                'postDesc': order.post!.description,
                                'orderStatus': order.status,
                                'methodType': order.methodType,
                                'totalPrice': order.finalAmount,
                                'discountAmount': order.discountAmount,
                                'voucher': order.voucher,
                                'date': DateFormat('yyyy MMMM dd').format(DateTime.parse(order.createdAt.toString()))
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
    );
  }
}


