import 'package:ayamku_admin/app/pages/features/analytic_page/items/item_sales_summary.dart';
import 'package:ayamku_admin/app/pages/features/product_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalesSummarySection extends StatelessWidget {
  const SalesSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    List salesSummary = [
      SalesItem.totalOrder,
      SalesItem.products,
      SalesItem.productss,
      SalesItem.totalSales
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Sales summary", style: txtHeadline3),

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
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2
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

