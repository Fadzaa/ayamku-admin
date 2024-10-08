import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/status_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemDeliveryVertical extends StatelessWidget{
  ItemDeliveryVertical({
    super.key,
    required this.username,
    required this.orderName,
    required this.orderTime,
    required this.orderStatus,
    required this.namePos,
    required this.cartItems,
    required this.onTap,
    required this.orderId, required this.profileUser, required this.sessionOrder,
  });

  final String username, orderName, namePos,profileUser,sessionOrder;
  final String orderId;
  final String orderTime;
  final List<CartItems> cartItems;
  final OrderStatus orderStatus;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderPageController());
    String formattedItems = cartItems.map((cartItem) {
      return '${cartItem.quantity} x ${cartItem.productName}';
    }).join(' + ');
    double totalPrice = cartItems.fold(0, (sum, cartItem) => sum + (cartItem.totalPrice ?? 0));

    return InkWell(
      onTap: onTap,
      child: Container(
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        profileUser,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Agar teks rata kiri
                      children: [
                        Text(
                          username,
                          style: txtListItemTitle,
                        ),
                        SizedBox(height: 5), // Jarak antara username dan tanggal
                        Text(
                          orderTime.toString(),
                          style: txtSecondaryTitle.copyWith(color: blackColor40),
                        ),
                      ],
                    ),
                  ],
                ),


                const SizedBox(height: 15,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Menampilkan semua item dalam satu baris
                        Expanded(
                          child: Text(
                            formattedItems,
                            style: txtSecondaryTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Spacer(), 
                        // Menampilkan total harga
                        Text(
                          controller.formatPrice(totalPrice.toInt()),
                          style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),


                const SizedBox(height: 10,),

                SizedBox(height: 15,),

                // Divider(height: 0.5, color: blackColor70,),

                // SizedBox(height: 15,),

                // Text("Note :",style: txtCaption,),
                //
                // SizedBox(height: 3,),
                //
                // Text("RAAAAWWRR, KIRIM NY CPT YH, SY LAPAR",style: txtCaption.copyWith(color: blackColor50),),
                //
                // SizedBox(height: 15,),

                Row(
                  children: [
                    SvgPicture.asset(icOrder,),

                    SizedBox(width: 5,),

                    Text("Akan diantarkan ", style: txtCaption,),

                    SizedBox(width: 10,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        sessionOrder ?? "09.40",
                        style: txtCaption.copyWith(),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 5,),

                Row(
                  children: [
                    SvgPicture.asset(icLocation,),

                    SizedBox(width: 10,),

                    Text(namePos, style: txtCaption)
                  ],
                ),

                SizedBox(height: 20,),

                TerimaPesanan(orderId: orderId, nama: username,)
              ])),
    );
  }
}


enum OrderStatus {
  onGoing,
  done,
  cancel,
  waiting,
}