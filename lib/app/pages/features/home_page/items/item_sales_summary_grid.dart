import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ItemSalesSummary extends GetView<HomePageController> {
  const ItemSalesSummary({
    super.key,
    required this.typeSalesItem,
    this.numberOfOrders,
    this.analyticSales,
    this.productSales,
    this.specialPage
  });

  final SalesItem typeSalesItem;
  final int? numberOfOrders;
  final int? analyticSales;
  final int? productSales;
  final bool? specialPage;


  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    switch(typeSalesItem) {
      case SalesItem.analytic:
        return InkWell(
          onTap: (){
            specialPage ?? false ? Container() : Get.toNamed(Routes.ANALYTIC_PAGE);
          },
          child: Container(
            width: ScreenWidth,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Analisis Penjualan", style: txtListItemTitle),

                    specialPage ?? false ? Container() : const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,)
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(analyticSales), style: txtHeadline2,),

                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: baseColor,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: SvgPicture.asset(icAnalytic),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        );

      case SalesItem.totalOrders:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          decoration: BoxDecoration(
              color: const Color(0xFFF8F9FB),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Total Penjualan", style: txtCaption),
                        // const SizedBox(width: 3,),
                        // Text("(items)", style: txtNavbar.copyWith(color: blackColor50))
                      ],
                    ),
                    // Text("+10%", style: txtCaption.copyWith(color: greenLight))
                  ]
              ),

              SizedBox(height: 7,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${numberOfOrders}", style: txtHarga),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: SvgPicture.asset(icTotalOrder),
                    ),
                  )
                ],
              )
            ],
          ),
        );

      case SalesItem.products:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          decoration: BoxDecoration(
              color: const Color(0xFFF8F9FB),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Produk (terjual)", style: txtCaption),

              SizedBox(height: 7,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(productSales.toString(), style: txtHarga),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: SvgPicture.asset(icTotalOrder),
                    ),
                  )
                ],
              )
            ],
          ),
        );
    }
  }
}

enum SalesItem {analytic, totalOrders, products }