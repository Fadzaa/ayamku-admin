import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderStatusSection extends StatelessWidget {
  const HeaderStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(15),
      width: screenWidth,
      decoration: BoxDecoration(
        color: greenGrass,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pesanan terkonfirmasi",style: txtListItemTitle),

              SizedBox(height: 10,),

              Text("Pesanan telah dikonfirmasi oleh AlyaaRana",style: txtCaption,)
            ],
          ),
          SvgPicture.asset(
            icSuccesful,
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}
