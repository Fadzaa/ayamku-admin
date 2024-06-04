import 'package:ayamku_admin/app/pages/features/home_page/items/item_sales_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_order_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/order_page/model/order_summary_data.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Summary", style: txtHeadline3),

        const SizedBox(height: 10,),

        GridView.builder(
            shrinkWrap: true,
            itemCount: order_summary_data.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 1.9
            ),
            itemBuilder: (context, index) =>
                ItemOrderSummary(
                    title: order_summary_data[index].title,
                    icon: order_summary_data[index].icon,
                    count: order_summary_data[index].count,
                )
        )
      ],
    );
  }
}
