import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/status_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemAllOrderVertical extends GetView<OrderPageController> {
  const ItemAllOrderVertical(
      {super.key,
      required this.username,
      required this.id,
      this.sessionOrder,
      required this.orderName,
      required this.namePos,
      required this.orderTime,
      required this.cartItems,
      required this.onTap,
      required this.method,
      required this.profileUser,
      required this.status});

  final String username, orderName, namePos, method, status, profileUser;
  final int id;
  final String? sessionOrder;
  final String orderTime;
  final List<CartItems> cartItems;
  final VoidCallback onTap;

  Widget getStatusWidget(String status, int orderId, String nameUser) {
    switch (status) {
      case 'processing':
        return TerimaPesanan(orderId: orderId, status: status, nama: nameUser);
      case 'completed':
        return PesananSelesai(nama: nameUser);
      // case 'confirm_order':
      //   return PesananDikonfirmasi();
      case 'accept':
        return AcceptedOrder(orderId: orderId, status: status, nama: nameUser);
      // case 'cancelled':
      //   return PesananDibatalkan();
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        crossAxisAlignment: CrossAxisAlignment.start, // Untuk menyelaraskan teks di kiri
                        children: [
                          Container(
                            width: screenWidth * 0.3,
                            child: Text(
                              username,
                              style: txtListItemTitle,
                              maxLines: 1, // Atur agar hanya satu baris untuk username
                              overflow: TextOverflow.ellipsis, // Jika teks terlalu panjang
                            ),
                          ),
                          SizedBox(height: 5), // Spasi antara username dan tanggal
                          Text(
                            orderTime.toString(),
                            style: txtSecondaryTitle.copyWith(color: blackColor40),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CommonButtonOutline(
                    text: status,
                    style: txtCaption.copyWith(
                      color: status == 'completed'
                          ? Colors.green
                          : (status == 'processing'
                              ? primaryColor
                              : (status == 'cancelled'
                                  ? Colors.red
                                  : (status == 'confirmed_order'
                                      ? Colors.green
                                      : (status == "accept"
                                          ? primaryColor
                                          : Colors.grey)))),
                    ),
                    onPressed: () {},
                    colorBorder: status == 'completed'
                        ? Colors.green
                        : (status == 'processing'
                            ? primaryColor
                            : (status == 'cancelled'
                                ? Colors.red
                                : (status == 'confirmed_order'
                                    ? Colors.green
                                    : (status == "accept"
                                        ? primaryColor
                                        : Colors.grey)))),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              
              Column(
                children: cartItems.map((cartItem) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${cartItem.quantity!.toString()} x', style: txtSecondaryTitle),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          cartItem.productName.toString(),
                          style: txtSecondaryTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Spacer(),
                      Text(
                        controller.formatPrice(cartItem.totalPrice ?? 0),
                        style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }).toList(),
              ),

              SizedBox(
                height: 15,
              ),
              // Divider(
              //   height: 0.5,
              //   color: blackColor70,
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Row(
                children: [
                  SvgPicture.asset(
                    icOrder,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    method == 'pickup' ? "Akan dijemput " : "Akan diantarkan ",
                    style: txtCaption,
                  ),
                  SizedBox(
                    width: 10,
                  ),
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
              SizedBox(
                height: 5,
              ),
              if (method != 'pickup')
                Row(
                  children: [
                    SvgPicture.asset(
                      icLocation,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(namePos, style: txtCaption)
                  ],
                ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: getStatusWidget(status, id, username),
              ),
              SizedBox(
                height: 5,
              ),
            ])),
    );
  }
}

class ItemAllOrderVerticalShimmer extends GetView<OrderPageController> {
  const ItemAllOrderVerticalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "username",
                      style: txtSecondaryTitle,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("orderTime",
                style: txtSecondaryTitle.copyWith(color: blackColor40)),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            // Divider(
            //   height: 0.5,
            //   color: blackColor70,
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            Row(
              children: [
                SvgPicture.asset(
                  icOrder,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Akan dijemput ",
                  style: txtCaption,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "09.40",
                    style: txtCaption.copyWith(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  icLocation,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("namePos", style: txtCaption)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: getStatusWidget(status, id),
            // ),
            SizedBox(
              height: 5,
            ),
          ])),
    );
  }
}
