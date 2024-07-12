import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({
    super.key,
    required this.idOrder,
    required this.userName,
    this.posName,
    this.posDesc,
  });

  final String idOrder, userName;
  final String? posName, posDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Order Id",
              style: txtSecondaryTitle,
            ),
            Row(children: [
              Text(
                idOrder,
                style: txtSecondaryTitle,
              ),
              SizedBox(width: 10),
              SvgPicture.asset(
                icCopy,
                width: 20,
                height: 20,
              ),
            ])
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                // radius: 25,
                backgroundImage: AssetImage(icPerson),
              ),
              SizedBox(width: 10),
              Text(
                userName,
                style: txtListItemTitle,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(icLocation),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posName?? '',
                      style: txtSecondaryTitle,
                    ),
                    SizedBox(height: 5),
                    AutoSizeText(
                      posDesc?? '',
                      softWrap: true,
                      maxLines: 3,
                      style: txtSecondaryTitle,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(icCalender),
              SizedBox(width: 10),
              Text(
                "20 Jan 2024, 1:54 pm",
                style: txtSecondaryTitle,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(color: blackColor50),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Note",
                style: txtHeadline3,
              ),
              SizedBox(height: 5),
              Text(
                "Jika ada kendala, silahkan hubungi Alyaa Rana.",
                style: txtCaption,
              ),
            ],
          )
        ],
      ),
    );
  }
}
