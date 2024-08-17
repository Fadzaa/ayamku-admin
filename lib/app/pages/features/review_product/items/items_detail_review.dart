import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemDetailReview extends StatelessWidget {
  const ItemDetailReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                icBack,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(icPerson),
            ),

            SizedBox(
              width: 10,
            ),

            Text("Alyaa Rana", style: txtTitlePage,),

          ],
        ),
      ),
      body: Container(
        color: baseColor,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index > 0 ? 5 : 0),
                      child: SvgPicture.asset(
                        icStar,
                        width: 15,
                        height: 15,
                      ),
                    );
                  }),
                ),

                SizedBox(width: 3,),

                Text("1 hari yang lalu", style: txtCaption),
              ],
            ),

            SizedBox(
              height: 5,
            ),

            Row(
              children: [
                Text("On_Delivery", style: txtCaption.copyWith(color: blackColor30)),

                SizedBox(width: 10,),

                Text("|", style: txtCaption.copyWith(color: blackColor30)),

                SizedBox(width: 10,),

                Text("09.40", style: txtCaption.copyWith(color: blackColor30)),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Text("Ayam nya enak, saya suka sekali, saya akan pesan lagi", style: txtBody),
          ],
        ),
      ),
    );
  }
}
