import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';

class ItemVoucherActiveVertical extends StatelessWidget {
  const ItemVoucherActiveVertical({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ListTile(

            title: Text("Diskon makanan 50%, maks. 20rb",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),

            subtitle: Row(
              children: [

                Text("20 Jan 2024, 1:54 pm"),

                SizedBox(width: 10),

                Text("-"),

                SizedBox(width: 10),

                Text("20 Jan 2024, 1:54 pm"),
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
  const ItemVoucherDeactiveVertical({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ListTile(

            title: Text("Diskon makanan 50%, maks. 20rb",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
            
            subtitle: Row(
              children: [

                Text("20 Jan 2024, 1:54 pm"),

                SizedBox(width: 10),

                Text("-"),

                SizedBox(width: 10),

                Text("20 Jan 2024, 1:54 pm"),
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
