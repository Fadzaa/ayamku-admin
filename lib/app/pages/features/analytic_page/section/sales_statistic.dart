import 'package:ayamku_admin/app/api/analytic/chart_revenue_response.dart';
import 'package:ayamku_admin/app/pages/features/analytic_page/analytic_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/analytic_page/model/stats.dart';
import 'package:ayamku_admin/app/pages/features/analytic_page/model/stats_data.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SalesStatisitc extends GetView<AnalyticPageController> {
  const SalesStatisitc({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Statistic Sales", style: txtHeadline3),
              ItemDropdownStatistic()
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Obx(
                  () => BarChart(
                    mainBarData(controller.chartRevenueResponse.value,
                        controller.dropdownValue.value),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

BarChartData mainBarData(ChartRevenueResponse crr, String dropdownValue) {
  return BarChartData(
    barTouchData: BarTouchData(
      touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.grey.withOpacity(0.8),
          tooltipMargin: 8,
          tooltipPadding: const EdgeInsets.all(8),
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            if (dropdownValue == "Mingguan") {
              List<String> weeksList = ["Week 1", "Week 2", "Week 3", "Week 4"];
              String week = weeksList[group.x.toInt()];
              String formattedValue = NumberFormat.currency(
                      locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
                  .format(rod.toY - 1);
              return BarTooltipItem(
                '$week\n',
                txtCaption.copyWith(color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: formattedValue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }

            List<String> daysList = getPastSevenDays();
            String weekDay = daysList[group.x.toInt()];
            String formattedValue = NumberFormat.currency(
                    locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
                .format(rod.toY - 1);
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: formattedValue,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          }),
      touchCallback: (FlTouchEvent event, barTouchResponse) {},
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: dropdownValue == "Harian"
              ? getTitles
              : dropdownValue == "Mingguan"
                  ? getTitlesWeekly
                  : getTitles,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (double value, TitleMeta meta) {
            String formattedValue = NumberFormat.currency(
                locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(value);

            return Text(formattedValue,
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12));
          },
          reservedSize: 70, // Sesuaikan ukuran jika diperlukan
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: dropdownValue == "Harian"
        ? showingGroups(crr)
        : dropdownValue == "Mingguan"
            ? showingGroupsWeekly(crr)
            : showingGroupsMonthly(crr),

    // gridData: const FlGridData(show: true,),
  );
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: blackColor,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  List<String> daysList = getPastSevenDays();

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(daysList[0].substring(0, 1).toUpperCase(), style: style);
      break;
    case 1:
      text = Text(daysList[1].substring(0, 1).toUpperCase(), style: style);
      break;
    case 2:
      text = Text(daysList[2].substring(0, 1).toUpperCase(), style: style);
      break;
    case 3:
      text = Text(daysList[3].substring(0, 1).toUpperCase(), style: style);
      break;
    case 4:
      text = Text(daysList[4].substring(0, 1).toUpperCase(), style: style);
      break;
    case 5:
      text = Text(daysList[5].substring(0, 1).toUpperCase(), style: style);
      break;
    case 6:
      text = Text(daysList[6].substring(0, 1).toUpperCase(), style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

Widget getTitlesWeekly(double value, TitleMeta meta) {
  const style = TextStyle(
    color: blackColor,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text("Week 1", style: style);
      break;
    case 1:
      text = Text("Week 2", style: style);
      break;
    case 2:
      text = Text("Week 3", style: style);
      break;
    case 3:
      text = Text("Week 4", style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

List<BarChartGroupData> showingGroups(ChartRevenueResponse chartRevenue) {
  final days = chartRevenue.daysRevenue;
  final daysMap = {
    'monday': days!.monday!,
    'tuesday': days.tuesday!,
    'wednesday': days.wednesday!,
    'thursday': days.thursday!,
    'friday': days.friday!,
    'saturday': days.saturday!,
    'sunday': days.sunday!,
  };

  List<String> daysList = getPastSevenDays();

  return List.generate(7, (i) {
    String day = daysList[i];
    int value = daysMap[day] ?? 0;
    return makeGroupData(i, value);
  });
}

List<BarChartGroupData> showingGroupsWeekly(ChartRevenueResponse chartRevenue) {
  final weeks = chartRevenue.weekRevenue;
  final weeksMap = {
    'week1': weeks!.week1!,
    'week2': weeks.week2!,
    'week3': weeks.week3!,
    'week4': weeks.week4!,
  };

  List<String> weeksList = ['week1', 'week2', 'week3', 'week4'];

  return List.generate(4, (i) {
    String week = weeksList[i];
    int value = weeksMap[week] ?? 0;
    return makeGroupData(i, value);
  });
}

List<BarChartGroupData> showingGroupsMonthly(
    ChartRevenueResponse chartRevenue) {
  final months = chartRevenue.monthlyRevenue;
  final monthsMap = {
    'january': months!.january!,
    'february': months.february!,
    'march': months.march!,
    'april': months.april!,
    'may': months.may!,
    'june': months.june!,
    'july': months.july!,
    'august': months.august!,
    'september': months.september!,
    'october': months.october!,
    'november': months.november!,
    'december': months.december!,
  };

  List<String> monthsList = [
    'january',
    'february',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december'
  ];

  return List.generate(12, (i) {
    String month = monthsList[i];
    int value = monthsMap[month] ?? 0;
    return makeGroupData(i, value);
  });
}

BarChartGroupData makeGroupData(
    int x,
    int y, {
      Color? barColor,
      double width = 22,
      List<int> showTooltips = const [],
    }) {
  barColor ??= primaryColor;
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y.toDouble(),
        color: barColor,
        width: width,
        borderSide: const BorderSide(color: grey, width: 0),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 20,
          color: grey,
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}


class ItemDropdownStatistic extends GetView<AnalyticPageController> {
  const ItemDropdownStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> day_select = ["Harian", "Mingguan"];

    return Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 145,
        decoration: BoxDecoration(
            border: Border.all(color: blackColor50, width: 0.5),
            borderRadius: BorderRadius.circular(8)),
        child: Obx(
          () => DropdownButton(
            dropdownColor: Colors.white,
            style: txtCaption.copyWith(color: blackColor),
            elevation: 1,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            borderRadius: BorderRadius.circular(8),
            underline: Container(),
            items: day_select
                .map((String day) => DropdownMenuItem(
                      child: Text(day),
                      value: day,
                    ))
                .toList(),
            onChanged: (value) =>
                controller.onChangeValue(value ?? "Harian", day_select),
            value: controller.dropdownValue.value,
          ),
        ));
  }
}
