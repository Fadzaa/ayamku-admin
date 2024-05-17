import 'package:ayamku_admin/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../../common/theme.dart';

class ItemHistoryTodayVertical extends StatelessWidget {
  const ItemHistoryTodayVertical({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(bottom: 15),
    child: SingleChildScrollView(
      child: SizedBox(
        height: 85,  // Increase height to avoid overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(icPerson),
                ),
                SizedBox(width: 10,),
                Text("Alyaa Rana", style: txtSecondaryTitle.copyWith(color: blackColor40),),
                Spacer(),
                Text("09.40", style: txtSecondaryTitle.copyWith(color: blackColor40),),
              ],
            ),
            Row(
              children: [
                Flexible( // Use Flexible to handle overflow
                  child: Text("PAHE Geprek, Ricebowl BBQ, Ricebowl BBQ..")
                )
              ],
            ),
            Row(// Adjust to avoid overflow
              children: [
                Text("2 Items",style: txtSecondaryTitle.copyWith(color: blackColor40),),
                Spacer(),
                Text("Total", style: txtSecondaryTitle.copyWith(color: blackColor40),),
                SizedBox(width: 20,),
                Text("Rp. 11.000", style: txtSecondaryTitle.copyWith(color: blackColor40),),
              ],
            ),
        ],
      ),
    )));
  }
}

class ItemHistoryYesterdayVertical extends StatelessWidget {
  const ItemHistoryYesterdayVertical({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(bottom: 15),
    child: SingleChildScrollView(
      child: SizedBox(
        height: 85,  // Increase height to avoid overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(icPerson),
                ),
                SizedBox(width: 10,),
                Text("Alyaa Rana", style: txtSecondaryTitle.copyWith(color: blackColor40),),
                Spacer(),
                Text("09.40", style: txtSecondaryTitle.copyWith(color: blackColor40),),
              ],
            ),
            Row(
              children: [
                Flexible( // Use Flexible to handle overflow
                  child: Text("PAHE Geprek, Ricebowl BBQ, Ricebowl BBQ..")
                )
              ],
            ),
            Row(// Adjust to avoid overflow
              children: [
                Text("2 Items",style: txtSecondaryTitle.copyWith(color: blackColor40),),
                Spacer(),
                Text("Total", style: txtSecondaryTitle.copyWith(color: blackColor40),),
                SizedBox(width: 20,),
                Text("Rp. 11.000", style: txtSecondaryTitle.copyWith(color: blackColor40),),
              ],
            ),
        ],
      ),
    )));
  }
}