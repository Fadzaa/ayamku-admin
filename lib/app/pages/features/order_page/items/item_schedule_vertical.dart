import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemScheduleVertical extends GetView<OrderPageController> {
  const ItemScheduleVertical({
    super.key,
    required this.username,
    required this.orderName,
    required this.orderTime,
    required this.orderPrice,
    required this.orderStatus
  });

  final String username, orderName;
  final DateTime orderTime;
  final int orderPrice;
  final ScheduleStatus orderStatus;

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
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(icPerson),
                  ),

                  SizedBox(width: 10,),

                  Text(username, style: txtSecondaryTitle,),
                ],
              ),

              SizedBox(height: 5,),

              Text(orderTime.toString(), style: txtSecondaryTitle.copyWith(
                  color: blackColor40
              )),

              const SizedBox(height: 10,),

              Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("x2", style: txtSecondaryTitle.copyWith(color: blackColor50),),
                        SizedBox(width: 10,),
                        Text(orderName, style: txtListItemTitle),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25,top: 5),
                      child: Column(
                        children: [
                          SizedBox(width: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Level:", style: txtSecondaryTitle.copyWith(color: blackColor50),),
                              SizedBox(width: 5,),
                              Text("Pedas", style: txtSecondaryTitle),
                            ],
                          ),
                        ],
                      ),
                    )]
              ),

              const SizedBox(height: 10,),


              SizedBox(height: 15,),

              Divider(height: 0.5, color: blackColor70,),

              // SizedBox(height: 15,),
              //
              // Text("Note :",style: txtCaption,),
              //
              // SizedBox(height: 3,),
              //
              // Text("RAAAAWWRR, KIRIM NY CPT YH, SY LAPAR",style: txtCaption.copyWith(color: blackColor50),),

              SizedBox(height: 15,),

              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, color: blackColor50, size: 20,),

                  SizedBox(width: 5,),

                  Text("Akan dijemput", style: txtCaption,),

                  SizedBox(width: 10,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Besok, 10:00", style: txtCaption.copyWith(),),
                  )
                ],
              ),

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
                            onPressed: () {},
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

enum ScheduleStatus {
  onGoing,
  done,
  cancel,
  waiting,
}
