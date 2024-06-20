import 'package:ayamku_admin/app/pages/features/voucher_management/bottomSheet/gift_voucher.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

voidMenuVoucher(BuildContext context, String name, String startDate, String endDate, String discount, String stock){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 250,
            padding: EdgeInsets.only(left: 15,right: 15,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: txtHeadline3),

                SizedBox(height: 5),

                Row(
                  children: [

                    Text(startDate,style: txtBody,),

                    SizedBox(width: 10),

                    Text("-"),

                    SizedBox(width: 10),

                    Text(endDate,style: txtBody,),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Text(discount,style: txtBody.copyWith(color: green),),

                    SizedBox(width: 10),

                    Text("•"),

                    SizedBox(width: 10),

                    Text(stock,style: txtBody),

                    SizedBox(width: 10),
                  ],
                ),

                Divider(color: blackColor50,),

                SizedBox(height: 15,),

                IcVoucherTap(
                    nama: "Edit",
                    icon: Icons.edit,
                    onPressed: (){}
                ),

                SizedBox(height: 15,),

                IcVoucherTap(
                  nama: "Bagikan",
                  icon: Icons.share,
                  onPressed: () => voidGiftVoucher(context),
                ),
              ],
            ),
          )
      )
  );
}

class IcVoucherTap extends StatelessWidget {
  const IcVoucherTap({Key? key, required this.nama, required this.icon, this.onPressed}) : super(key: key);

  final String nama;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(icon),

          SizedBox(width: 10),

          Text(nama, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}