import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ItemHistoryVertical extends StatelessWidget {
  const ItemHistoryVertical({
    super.key,
    required this.username,
    required this.orderName,
    required this.orderTime,
    required this.orderPrice,
    required this.orderStatus,
  });

  final String username, orderName;
  final String orderTime;
  final int orderPrice;
  final OrderStatus orderStatus;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(sampleImage, width: 57, height: 57),

              const SizedBox(width: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username, style: txtCaption.copyWith(color: blackColor40),),

                  const SizedBox(height: 5,),

                  Text(orderName, style: txtSecondaryTitle,),

                  const SizedBox(height: 5,),

                  Text(orderTime.toString(), style: txtSecondaryTitle.copyWith(color: blackColor40),),


                ],
              )
            ]
          ),

          Text(orderPrice.toString(), style: txtCaption)


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
