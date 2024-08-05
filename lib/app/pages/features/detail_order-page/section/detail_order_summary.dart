import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOrderSummary extends GetView<DetailOrderPageController> {
  const DetailOrderSummary({super.key,});


  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;

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
                      image: sampleImage,
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
              Payment(text: "Sub total", subTxt: "Rp. 13.000"),
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
                    controller.formatPrice(argument['totalPrice'] ?? 0),
                    style: txtHeadline3,
                  )
                ],
              )
            ],
          )
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

class ItemSectionOrderMenu extends StatelessWidget {
  const ItemSectionOrderMenu({super.key, required this.image, required this.menuName, required this.price, required this.quantity});

  final String image, menuName, price, quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 43,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        quantity,
                        style: txtSecondaryTitle,
                      ), // count
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "x",
                        style: txtSecondaryTitle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    menuName,
                    style:
                    txtSecondaryTitle.copyWith(color: blackColor30),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Pedas",
                    style: txtSecondaryTitle,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "+",
                    style: txtSecondaryTitle,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Es teh",
                    style: txtSecondaryTitle,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            price,
            style: txtSecondaryTitle,
          )
        ],
      ),
    );
  }
}

