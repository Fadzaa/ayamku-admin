import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_alert_dialog.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TerimaPesanan extends GetView<OrderPageController> {
  const TerimaPesanan({super.key, required this.orderId, this.status});
  final int orderId;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (controller.isOrderCancelled(orderId.toString()) && status == "cancelled") {
          return PesananDibatalkan();
        } else if (controller.isOrderAccepted(orderId.toString()) && status == "accept") {
          return Align(
              alignment: Alignment.centerRight,
              child: AcceptedOrder(orderId: orderId, status : "accept")
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonButtonOutline(
                text: "Lihat detail",
                style: txtCaption.copyWith(color: primaryColor),
                onPressed: () {},
                color: primaryColor,
              ),

              Row(
                children: [
                  LittleBtn(
                        text: "Tolak",
                        style: txtCaption.copyWith(color: Colors.white),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CommonAlertDialog(
                                title: 'Apakah anda akan membatalkan pesanan ini?',
                                onCancel: () {
                                  Get.back();
                                },
                                onConfirm: () async {
                                  controller.cancelOrder(orderId.toString());
                                  Get.back();
                                }
                              );
                            },
                          );
                        },
                        txtColor: Colors.white,
                        color: red,
                      ),

                  SizedBox(
                    width: 10,
                  ),
                  LittleBtn(
                    text: "Terima",
                    style: txtCaption.copyWith(color: Colors.white),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CommonAlertDialog(
                              title: 'Apakah anda akan menerima pesanan ini?',
                              onCancel: () {
                                Get.back();
                              },
                              onConfirm: () async {
                                controller.acceptOrder(orderId.toString());
                                Get.back();
                              }
                          );
                        },
                      );
                    },
                    txtColor: Colors.white,
                    color: greenMedium,
                  ),
                ],
              ),
            ],
          );
        }
      }),
    );
  }
}

class AcceptedOrder extends GetView<OrderPageController> {
  AcceptedOrder({super.key, required this.orderId, this.status});
  final int orderId;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isOrderCompleted(orderId.toString()) && status == "completed") {
        return PesananSelesai();
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LittleBtn(
              text: "Pesanan diterima",
              style: txtCaption.copyWith(color: Colors.white),
              onPressed: () {},
              color: primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            LittleBtn(
              text: "Selesaikan pesanan",
              style: txtCaption.copyWith(color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CommonAlertDialog(
                        title: 'Apakah anda akan menyelesaikan pesanan ini?',
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () async{
                          controller.completeOrder(orderId.toString());
                          Get.back();
                        }
                    );
                  },
                );
              },
              color: greenMedium,
            ),
          ],
        );
      }
    });
  }
}

class PesananSelesai extends StatelessWidget {
  const PesananSelesai({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LittleBtn(
          text: "Pesanan selesai",
          style: txtCaption.copyWith(color: Colors.white),
          onPressed: () {},
          color: primaryColor,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "*silahkan tunggu konfirmasi pesanan",
          style: txtCaption.copyWith(color: blackColor50),
        )
      ],
    );
  }
}

class PesananDikonfirmasi extends StatelessWidget {
  const PesananDikonfirmasi({super.key});

  @override
  Widget build(BuildContext context) {
    return LittleBtn(
      text: "Pesanan dikonfirmasi",
      style: txtCaption.copyWith(color: Colors.white),
      onPressed: () {},
      color: greenMedium,
    );
  }
}

class PesananDibatalkan extends StatelessWidget {
  const PesananDibatalkan({super.key});

  @override
  Widget build(BuildContext context) {
    return LittleBtn(
      text: "Pesanan dibatalkan",
      style: txtCaption.copyWith(color: Colors.white),
      onPressed: () {},
      color: Colors.red,
    );
  }
}






