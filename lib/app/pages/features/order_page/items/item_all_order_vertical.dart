import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemAllOrderVertical extends StatelessWidget {
  const ItemAllOrderVertical({super.key, required this.username, required this.orderName, required this.namePos, required this.orderTime, required this.cartItems, required this.onTap, required this.method});

  final String username, orderName, namePos, method;
  final DateTime orderTime;
  final List<CartItems> cartItems;
  final VoidCallback onTap;

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

                  if (method != 'pickup')
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      decoration: BoxDecoration(
                        color: primaryColor40,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(namePos, style: txtCaption)
                  )
                ],
              ),

              SizedBox(height: 5,),

              Text(orderTime.toString(), style: txtSecondaryTitle.copyWith(
                  color: blackColor40
              )),

              const SizedBox(height: 15,),

              Column(
                children: cartItems.map((cartItem) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(cartItem.quantity!.toString(), style: txtSecondaryTitle.copyWith(color: blackColor50)),
                      SizedBox(width: 10),
                      Text(cartItem.productName.toString(), style: txtListItemTitle),
                      Divider(height: 0.5, color: blackColor70,),
                      Text(cartItem.price.toString(), style: txtListItemTitle),
                    ],
                  );
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 25,top: 3),
                  //   child: Column(
                  //     children: [
                  //       SizedBox(width: 5,),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Text("Level:", style: txtSecondaryTitle.copyWith(color: blackColor50),),
                  //           SizedBox(width: 5,),
                  //           Text("Pedas", style: txtSecondaryTitle),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                }).toList(),
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
                children: [
                  SvgPicture.asset(icOrder,),

                  SizedBox(width: 5,),

                  Text(method == 'pickup' ? "Akan dijemput " : "Akan diantarkan ", style: txtCaption,),

                  SizedBox(width: 10,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("09.40", style: txtCaption.copyWith(),),
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
                    onPressed: onTap,
                    color: primaryColor,
                  ),

                  // Obx(() {
                  //   if (controller.isOrderAccepted.value) {
                  //     return LittleBtn(
                  //       text: "Sedang diproses",
                  //       style: txtCaption.copyWith(color: Colors.white),
                  //       onPressed: (){},
                  //       txtColor: Colors.white,
                  //       color: primaryColor,
                  //     );
                  //   } else {
                  //     return Row(
                  //       children: [
                  //         LittleBtn(
                  //           text: "Tolak pesananan",
                  //           style: txtCaption.copyWith(color: Colors.white),
                  //           onPressed: (){},
                  //           txtColor: Colors.white,
                  //           color: red,
                  //         ),
                  //
                  //         SizedBox(width: 10,),
                  //
                  //         LittleBtn(
                  //           text: "Terima",
                  //           style: txtCaption.copyWith(color: Colors.white),
                  //           onPressed: () {
                  //             // showDialog(
                  //             //   context: context,
                  //             //   builder: (BuildContext context) {
                  //             //     return AlertDialog(
                  //             //       title: Text('Confirm'),
                  //             //       content: Text('Are you sure you want to accept the order?'),
                  //             //       actions: <Widget>[
                  //             //         TextButton(
                  //             //           child: Text('Cancel'),
                  //             //           onPressed: () {
                  //             //             Navigator.of(context).pop();
                  //             //           },
                  //             //         ),
                  //             //         TextButton(
                  //             //           child: Text('Yes'),
                  //             //           onPressed: () {
                  //             //             controller.acceptOrder();
                  //             //             Navigator.of(context).pop();
                  //             //           },
                  //             //         ),
                  //             //       ],
                  //             //     );
                  //             //   },
                  //             // );
                  //           },
                  //           txtColor: Colors.white,
                  //           color: greenMedium,
                  //         ),
                  //       ],
                  //     );
                  //   }
                  // }),
                ],
              ),
            ]));
  }
}
