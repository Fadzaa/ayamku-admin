import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ItemOrderVertical extends StatelessWidget {
  const ItemOrderVertical({
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
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(username, style: txtCaption.copyWith(color: blackColor40),),

              Row(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Pos 1", style: txtCaption)
                  ),

                  SizedBox(width: 10,),

                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: primaryColor40,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle
                          ),
                        ),

                        const SizedBox(width: 5,),

                        Text("Terima", style: txtCaption.copyWith(color: blackColor))
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),

          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(orderName, style: txtSecondaryTitle),

              Text("Rp. 11.000", style: txtCaption,)
            ],
          ),

          const SizedBox(height: 10,),

          Text(orderTime.toString(), style: txtSecondaryTitle.copyWith(
            color: blackColor40
          ))
        ],
      ),
    );
  }
}


enum OrderStatus {
  onGoing,
  done,
  cancel,
  waiting,
}
