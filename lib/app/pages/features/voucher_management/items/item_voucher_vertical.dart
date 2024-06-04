import 'package:ayamku_admin/app/pages/features/voucher_management/voucher_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';

class ItemVoucherActiveVertical extends StatelessWidget {
  const ItemVoucherActiveVertical({super.key, required this.name, required this.startDate, required this.endDate});

  final String name, startDate, endDate;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoucherPageController());
    
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   Text("Diskon makanan 50%, maks. 20rb",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),

                  SizedBox(height: 10),

                  Row(
                    children: [

                      Text("20 Jan 2024"),

                      SizedBox(width: 10),

                      Text("-"),

                      SizedBox(width: 10),

                      Text("20 Jan 2024"),
                    ],
                  ),
                ],
              ),
            Text("active",style: TextStyle(color: greenMedium, fontSize: 14),)

            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

class ItemVoucherDeactiveVertical extends StatelessWidget {
  const ItemVoucherDeactiveVertical({super.key, required this.name, required this.startDate, required this.endDate});

  final String name, startDate, endDate;

  @override
  Widget build(BuildContext context) {

    returnContainer(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Diskon makanan 50%, maks. 20rb",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),

                  SizedBox(height: 10),

                  Row(
                    children: [

                      Text("20 Jan 2024"),

                      SizedBox(width: 10),

                      Text("-"),

                      SizedBox(width: 10),

                      Text("20 Jan 2024"),
                    ],
                  ),
                ],
              ),
              Text("deactive",style: TextStyle(color: errorColor, fontSize: 14),)

            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
