import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemPromoSection extends StatelessWidget {
  const ItemPromoSection({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ItemPromo(
          name: "Promo Natal",
          desc: "Selama natal",
          date: "25 Desember 2024",
          image: promoNatal
      ),

    );
  }
}

class ItemPromo extends StatelessWidget {
  const ItemPromo({
    super.key,
    required this.name,
    required this.desc,
    required this.date,
    required this.image,
  });

  final String name;
  final String desc;
  final String date;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenWIdth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    name,
                    style: txtListItemTitle,
                  ),

                  SizedBox(height: 5),

                  Text(
                    date,
                    style: txtSecondaryTitle.copyWith(color: blackColor40),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.center,
                child: Text(
                  desc,
                  style: txtSecondaryTitle.copyWith(color: blackColor40),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(
              image,
              width: screenWIdth,
            ),
          ),


          Divider(color: blackColor90,)
        ],
      ),
    );
  }
}

