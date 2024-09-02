import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/items/item_section_order_menu.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOrderSummary extends GetView<DetailOrderPageController> {
  const DetailOrderSummary({super.key, required this.orderId});
  final String orderId;


  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    final orderController = Get.put(OrderPageController());

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ringkasan order
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ringkasan order",
                style: txtHeadline3,
              ),
              SizedBox(height: 10),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: argument['cartItems'].length,
                itemBuilder: (BuildContext context, int index) {
                  final cartItem = argument['cartItems'][index];
                  return ItemSectionOrderMenu(
                      image: cartItem.productImage.toString(),
                      menuName: cartItem.productName,
                      price: controller.formatPrice(cartItem.totalPrice ?? 0),
                      quantity: cartItem.quantity.toString()
                  );
                },
              ),

            ],
          ),

          SizedBox(
            height: 20,
          ),

          //Pembayaran & total
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pembayaran",
                style: txtHeadline3,
              ),
              SizedBox(height: 10),
              Payment(text: "Sub total", subTxt: controller.formatPrice(argument['originalAmount'] ?? 0)),
              // Payment(text: "Biaya admin", subTxt: "Rp. 5.000"),
              Payment(text: "Potongan voucher", subTxt: controller.formatPrice(argument['discountAmount'] ?? 0)),
              Divider(
                color: blackColor80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: txtHeadline3,
                  ),
                  Text(
                    controller.formatPrice(argument['finalAmount'] ?? 0),
                    style: txtHeadline3,
                  )
                ],
              )
            ],
          ),

          SizedBox(
            height: 20,
          ),

          //Metode pembayaran
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Metode pembayaran",
                style: txtHeadline3,
              ),
              SizedBox(height: 10),
              Text(
                "Dana",
                style: txtSecondaryTitle,
              )
            ],
          ),

          SizedBox(height: 20,),

          Text(
            "Ringkasan pemesanan",
            style: txtHeadline3,
          ),
          SizedBox(height: 10,),
          // Ringkasan pemesanan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Metode pemesanan",
                style: txtSecondaryTitle,
              ),
              Text(
                argument['methodType'],
                style: txtSecondaryTitle,
              )
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sesi order",
                style: txtSecondaryTitle,
              ),
              Text(
                argument['session_order'] ?? '',
                style: txtSecondaryTitle,
              )
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Waktu pemesanan",
                style: txtSecondaryTitle,
              ),
              Text(
                argument['date'.toString()],
                style: txtSecondaryTitle,
              )
            ],
          ),

          SizedBox(height: 20),

          if(argument['orderStatus'] == 'processing')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: LittleBtn(
                          text: "Terima",
                          onPressed: () async {
                            orderController.acceptOrder(orderId.toString());
                            Navigator.of(context).pop();
                          },
                          color: greenMedium
                      ),
                    ),

                    SizedBox(width: 15,),

                    Expanded(
                      child: LittleBtn(
                          text: "Tolak",
                          onPressed:() async {
                            orderController.cancelOrder(orderId.toString());
                            Navigator.of(context).pop();
                          },
                          color: red
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5,),

                Text("*silahkan terima pesanan dari ${argument['userName']} jika anda menyetujuinya", style: txtCaption.copyWith(color: blackColor50)),
              ],
            ),


          // SizedBox(height: 20),
          if(controller.orderStatus.value == "accept")
            LittleBtn(
                text: "Selesaikan pesanan",
                onPressed: () async {
                  orderController.acceptOrder(orderId.toString());
                  Navigator.of(context).pop();
                },
                color: greenMedium
            ),


          SizedBox(height: 15),


        ],
      ),
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({super.key, required this.text, required this.subTxt});

  final String text, subTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: txtSecondaryTitle,
          ),
          Text(
            subTxt,
            style: txtSecondaryTitle,
          ),
        ],
      ),
    );
  }
}



