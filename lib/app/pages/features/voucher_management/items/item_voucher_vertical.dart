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

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ListTile(

            title: Text(name,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),

            subtitle: Row(
              children: [

                Text(startDate),

                SizedBox(width: 10),

                Text("-"),

                SizedBox(width: 10),

                Text(endDate),
              ],
            ),

            trailing: Text("active",style: TextStyle(color: greenMedium, fontSize: 14),),
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

    return Container(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ListTile(

            title: Text(name,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),

            subtitle: Row(
              children: [

                Text(startDate),

                SizedBox(width: 10),

                Text("-"),

                SizedBox(width: 10),

                Text(endDate),
              ],
            ),

            trailing: Text("active",style: TextStyle(color: errorColor, fontSize: 14),),

          ),

          Divider(),
          
        ],
      ),
    );
  }
}
