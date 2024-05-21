import 'package:ayamku_admin/app/pages/features/analytic_page/model/stats.dart';
import 'package:ayamku_admin/app/pages/features/analytic_page/model/stats_data.dart';
import 'package:ayamku_admin/app/pages/features/product_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SalesStatisitc extends StatelessWidget {
  const SalesStatisitc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Statistik penjualan", style: txtHeadline3),

            ItemDropdownDay()
          ],
        ),
        
        SizedBox(height: 15,),

        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: blackColor80),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inventory Overview  -Today",
                style: txtHeadline3,
              ),

              SizedBox(height: 5,),

              SizedBox(
                height: 300,
                child: SalesStats(
                  stats: stats_data,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SalesStats extends StatelessWidget {
  const SalesStats({
    super.key,
    required this.stats
  });

  final List<Stats> stats;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Stats, String>> order = [
      charts.Series(
          id: '',
          data: stats,
          domainFn: (order, _) => order.index.toString(),
          measureFn: (order, _) => order.orders,
          colorFn: (order, _) => order.barColor!
      )
    ];

    return charts.BarChart(
      order,
      animate: true,
      domainAxis: const charts.OrdinalAxisSpec(
        showAxisLine: true,
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 12,
            color: charts.MaterialPalette.black,
          ),
          lineStyle: charts.LineStyleSpec(
            thickness: 1,
            color: charts.MaterialPalette.black,
          ),
        ),
      ),
      primaryMeasureAxis: const charts.NumericAxisSpec(
        showAxisLine: true,
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          desiredTickCount: 5,
        ),
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 12,
            color: charts.MaterialPalette.black,
          ),
          lineStyle: charts.LineStyleSpec(
            thickness: 0,
            color: charts.MaterialPalette.transparent,
          ),
          axisLineStyle: charts.LineStyleSpec(
            thickness: 1,
            color: charts.MaterialPalette.black,
          ),
        ),
      ),
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(2),
        maxBarWidthPx: 40,
      ),
    );
  }
}
