import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                              return CommonAlert(
                                title: 'Batalkan pesanan',
                                content: "Batalkan orderan ini sekarang?",
                                onCancel: () {
                                  Get.back();
                                },
                                onConfirm: () async {
                                  controller.cancelOrder(orderId.toString());
                                  Navigator.of(context).pop();
                                },
                                confirmText: 'Ya',
                                cancelText: 'Tidak',
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
                          return CommonAlert(
                            title: 'Terima pesanan',
                            content: "Terima pesanan ini sekarang?",
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () async {
                              controller.acceptOrder(orderId.toString());
                              Navigator.of(context).pop();
                            },
                            confirmText: 'Ya',
                            cancelText: 'Tidak',
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
                controller.completeOrder(orderId.toString());
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

class CommonAlert extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CommonAlert({
    Key? key,
    required this.title,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child :  SvgPicture.asset(icCancel,color: Colors.black,)
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                  title,
                  style: txtListItemTitle
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                  content,
                  style: txtBody
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 25,  right:25,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LittleBtn(
                    text: confirmText,
                    style: txtCaption.copyWith(color: Colors.white),
                    onPressed: () {
                      onConfirm();
                    },
                    txtColor: Colors.white,
                    color: greenAlert,
                  ),
                  LittleBtn(
                    text: cancelText,
                    style: txtCaption.copyWith(color: Colors.white),
                    onPressed: () {
                      onCancel();
                    },
                    txtColor: Colors.white,
                    color: red,
                  ),

                ],
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
