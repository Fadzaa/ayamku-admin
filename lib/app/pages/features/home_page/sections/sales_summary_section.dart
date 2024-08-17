import 'package:ayamku_admin/app/api/sales-summary/sales_model.dart';
import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_sales_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesSummarySection extends GetView<HomePageController> {
  const SalesSummarySection({
    super.key,
    required this.salesResponse
  });

  final SalesResponse salesResponse;

  @override
  Widget build(BuildContext context) {
    List salesSummary = [
      SalesItem.analytic,
      SalesItem.totalOrders,
      SalesItem.products
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Sales Summary", style: txtHeadline3),

            ItemDropdownDay()
          ],
        ),

        const SizedBox(height: 10,),

        ItemSalesSummary(typeSalesItem: salesSummary[0], analyticSales: int.parse(salesResponse.totalSales ?? "0"),),

        const SizedBox(height: 15,),

        Row(
          children: [
          Expanded(child: ItemSalesSummary(typeSalesItem: salesSummary[1], numberOfOrders: salesResponse.totalOrder,)),

            const SizedBox(width: 15,),

            Expanded(child: ItemSalesSummary(typeSalesItem: salesSummary[2], productSales: salesResponse.totalProduct,)),
          ],
        )
      ],
    );
  }
}