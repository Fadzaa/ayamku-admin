import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({
    super.key,
    required this.idOrder,
    required this.userName,
    required this.status,
    required this.date,
    this.posName,
    this.posDesc,
    required this.profileUser,
  });

  final String idOrder, userName, status,date, profileUser;
  final String? posName, posDesc;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Order id",
                style: txtHeadline3,
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(idOrder),
                  InkWell(
                      onTap: (){
                        Clipboard.setData(ClipboardData(text:idOrder)).then((value) {
                          Get.snackbar('Berhasil', 'Order ID berhasil disalin');
                        });
                      },
                      child: SvgPicture.asset(icCopy)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  profileUser,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),),
              SizedBox(width: 10),
              Container(
                width: screenWidth * 0.4,
                child: Text(
                  userName,
                  style: txtListItemTitle,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: txtCaption.copyWith(color: primaryColor),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
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
            height: 15,
          ),
          Row(
            children: [
              SvgPicture.asset(icCalender),
              SizedBox(width: 10),
              Text(
                date,
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
