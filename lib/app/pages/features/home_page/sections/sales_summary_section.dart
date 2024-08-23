import 'package:ayamku_admin/app/api/sales-summary/sales_model.dart';
import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_sales_summary_grid.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SalesSummarySection extends GetView<HomePageController> {
  const SalesSummarySection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Obx(() => controller.isLoadingSales.value ? SalesSummaryShimmer() : SalesSummaryContent(isShimmer: false));
  }
}

class SalesSummaryContent extends GetView<HomePageController> {
  const SalesSummaryContent({
    super.key,
    required this.isShimmer
  });

  final bool isShimmer;

  @override
  Widget build(BuildContext context) {
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

        ItemSalesSummary(typeSalesItem: SalesItem.analytic, analyticSales: isShimmer ? 0 : controller.salesResponse.sales),

        const SizedBox(height: 15,),

        Row(
          children: [
            Expanded(child: ItemSalesSummary(typeSalesItem: SalesItem.totalOrders, numberOfOrders: isShimmer ? 0 : controller.salesResponse.totalSales)),

            const SizedBox(width: 15,),

            Expanded(child: ItemSalesSummary(typeSalesItem: SalesItem.products, productSales: isShimmer ? 0 : controller.salesResponse.totalProduct)),
          ],
        )
      ],
    );
  }
}


class SalesSummaryShimmer extends StatelessWidget {
  const SalesSummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SalesSummaryContent(isShimmer: true)
    );

  }
}
