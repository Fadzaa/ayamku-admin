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
      SalesItem.totalSales,
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

        GridView.builder(
            shrinkWrap: true,
            itemCount: salesSummary.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 7,
                mainAxisSpacing: 10,
                childAspectRatio: 1.8
            ),
            itemBuilder: (context, index) =>
                ItemSalesSummary(
                  typeSalesItem: salesSummary[index],
                )
        )
      ],
    );
  }
}
