import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PenilaianSection extends StatelessWidget {
  const PenilaianSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Penilaian", style: txtHeadline3,),
              CommonButton(width: 82, text: "Balas", onPressed: (){}, style: txtCaption.copyWith(color: blackColor),)
            ],
          ),

          SizedBox(height: 15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(icPerson),
              ),

              SizedBox(width: 10,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AlyaaRana",
                    style: txtSecondaryTitle
                  ),

                  SizedBox(height: 5,),

                  Row(
                    children: List.generate(5, (index){
                      return Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(
                          icStar,
                        )
                      );
                    })
                      ,
                  )
                ],
              )
            ],
          ),

          SizedBox(height: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Makanan nya enak 👌",
                style: TextStyle(fontSize: 17),
              ),

              SizedBox(width: 5,),

              Row(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      sampleImage,
                      width: 70,
                      height: 70,
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
