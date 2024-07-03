import 'package:ayamku_admin/app/pages/features/home_page/items/item_sales_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/product_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class SalesSummarySection extends StatelessWidget {
  const SalesSummarySection({super.key});

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

        ItemSalesSummary(typeSalesItem: salesSummary[0]),

        const SizedBox(height: 15,),

        Row(
          children: [
            Expanded(child: ItemSalesSummary(typeSalesItem: salesSummary[1])),

            const SizedBox(width: 15,),

            Expanded(child: ItemSalesSummary(typeSalesItem: salesSummary[2])),
          ],
        )
      ],
    );
  }
}
