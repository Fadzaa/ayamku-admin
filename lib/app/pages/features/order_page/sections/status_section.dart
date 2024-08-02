import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TerimaPesanan extends GetView<OrderPageController> {
  const TerimaPesanan({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // CommonButtonOutline(
        //   text: "Lihat detail",
        //   style: txtCaption.copyWith(color: primaryColor),
        //   onPressed: (){},
        //   color: primaryColor,
        // ),

        Obx(() {
          if (controller.isOrderCancelled(orderId)) {
            return PesananDibatalkan();
          } else if (controller.isOrderAccepted(orderId)) {
            return Align(
                alignment: Alignment.centerRight,
                child: CompleteOrder(orderId: orderId,)
            );
          } else {
            return Row(
              children: [
                CommonButtonOutline(
                  text: "Lihat detail",
                  style: txtCaption.copyWith(color: primaryColor),
                  onPressed: () {},
                  color: primaryColor,
                ),

                SizedBox(width: 10,),

                LittleBtn(
                      text: "Tolak pesananan",
                      style: txtCaption.copyWith(color: Colors.white),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirm'),
                              content: Text(
                                  'Are you sure you want to cancel the order?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {

                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    controller.cancelOrder(orderId);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
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
                        return AlertDialog(
                          title: Text('Confirm'),
                          content: Text(
                              'Are you sure you want to accept the order?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {

                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                controller.acceptOrder(orderId);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  txtColor: Colors.white,
                  color: greenMedium,
                ),
              ],
            );
          }
        }),
      ],
    );
  }
}

class CompleteOrder extends GetView<OrderPageController> {
  CompleteOrder({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LittleBtn(
          text: "Pesanan diproses",
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
            controller.completeOrder(orderId);
          },
          color: greenMedium,
        ),
      ],
    );
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
