import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemSalesSummary extends GetView<HomePageController> {
  const ItemSalesSummary({
    super.key,
    required this.typeSalesItem,
    this.numberOfOrders,
  });

  final SalesItem typeSalesItem;
  final int? numberOfOrders;


  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    switch(typeSalesItem) {
      case SalesItem.analytic:
        return InkWell(
          onTap: (){
            Get.toNamed(Routes.ANALYTIC_PAGE);
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
                    Text("Analytic Sales", style: txtListItemTitle),

                    const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16,)
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Rp. 1.120.000", style: txtHeadline2,),

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

      // case SalesItem.totalSales:
      //   return Container(
      //     padding: const EdgeInsets.all(16.0),
      //     decoration: BoxDecoration(
      //         color: const Color(0xFFF8F9FB),
      //         borderRadius: BorderRadius.circular(16)
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text("Total Sales", style: txtCaption),
      //
      //             const SizedBox(width: 10,),
      //
      //             Text("-10%", style: txtCaption.copyWith(color: pinkLight))
      //           ],
      //         ),
      //
      //         Text("Rp. 1.120.000", style: txtHarga)
      //
      //       ],
      //     ),
      //   );

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
                      Text("Total Sales", style: txtCaption),
                      const SizedBox(width: 3,),
                      Text("(items)", style: txtNavbar.copyWith(color: blackColor50))
                    ],
                  ),
                  Text("+10%", style: txtCaption.copyWith(color: greenLight))
                ]
              ),

              SizedBox(height: 7,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${controller.numberOfOrders.value}", style: txtHarga),
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
              Text("Products", style: txtCaption),

              SizedBox(height: 7,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("150", style: txtHarga),
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
