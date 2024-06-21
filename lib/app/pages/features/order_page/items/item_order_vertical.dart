import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemOrderVertical extends StatelessWidget{
  final controller = Get.put(OrderPageController());
  ItemOrderVertical({
    super.key,
    required this.username,
    required this.orderName,
    required this.orderTime,
    required this.orderPrice,
    required this.orderStatus,
  });

  final String username, orderName;
  final DateTime orderTime;
  final int orderPrice;
  final OrderStatus orderStatus;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(icPerson),
                  ),

                  SizedBox(width: 10,),

                  Text(username, style: txtSecondaryTitle,),
                ],
              ),

              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    color: primaryColor40,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("Pos 1", style: txtCaption)
              )
            ],
          ),

          SizedBox(height: 5,),

          Text(orderTime.toString(), style: txtSecondaryTitle.copyWith(
              color: blackColor40
          )),

          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(orderName, style: txtSecondaryTitle),

              Text("x2", style: txtSecondaryTitle.copyWith(color: blackColor50),),

              Text("Rp. 11.000", style: txtCaption,)
            ],
          ),

          const SizedBox(height: 10,),


          SizedBox(height: 15,),

          Divider(height: 0.5, color: blackColor70,),

          SizedBox(height: 15,),

          Text("Note :",style: txtCaption,),

          SizedBox(height: 3,),

          Text("RAAAAWWRR, KIRIM NY CPT YH, SY LAPAR",style: txtCaption.copyWith(color: blackColor50),),

          SizedBox(height: 15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonButtonOutline(
                text: "Lihat detail",
                style: txtCaption.copyWith(color: primaryColor),
                onPressed: (){},
                color: primaryColor,
              ),

              Obx(() {
                if (controller.isOrderAccepted.value) {
                  return LittleBtn(
                    text: "Sedang diproses",
                    style: txtCaption.copyWith(color: Colors.white),
                    onPressed: (){},
                    txtColor: Colors.white,
                    color: primaryColor,
                  );
                } else {
                  return Row(
                    children: [
                      LittleBtn(
                        text: "Tolak pesananan",
                        style: txtCaption.copyWith(color: Colors.white),
                        onPressed: (){},
                        txtColor: Colors.white,
                        color: red,
                      ),

                      SizedBox(width: 10,),

                      LittleBtn(
                        text: "Terima",
                        style: txtCaption.copyWith(color: Colors.white),
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: Text('Confirm'),
                          //       content: Text('Are you sure you want to accept the order?'),
                          //       actions: <Widget>[
                          //         TextButton(
                          //           child: Text('Cancel'),
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //           },
                          //         ),
                          //         TextButton(
                          //           child: Text('Yes'),
                          //           onPressed: () {
                          //             controller.acceptOrder();
                          //             Navigator.of(context).pop();
                          //           },
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );
                        },
                        txtColor: Colors.white,
                        color: greenMedium,
                      ),
                    ],
                  );
                }
              }),
            ],
      ),
    ]));
  }
}


enum OrderStatus {
  onGoing,
  done,
  cancel,
  waiting,
}



