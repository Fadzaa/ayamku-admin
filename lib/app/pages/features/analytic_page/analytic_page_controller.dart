import 'dart:convert';

import 'package:ayamku_admin/app/api/analytic/chart_revenue_response.dart';
import 'package:ayamku_admin/app/api/analytic/chart_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AnalyticPageController extends GetxController{
  Rx<ChartRevenueResponse> chartRevenueResponse = ChartRevenueResponse().obs;
  ChartService chartService = ChartService();

  RxBool isLoading = false.obs;

  RxString dropdownValue = "Harian".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print("CHECK INIT ANALYTIC PAGE CONTROLLER");

    getChartRevenue();
  }

  Future<void> getChartRevenue() async {
    try {
      isLoading(true);
      chartRevenueResponse.value = await chartService.getChartRevenue();

    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void onChangeValue(String selectDay, List<String> items) {
    dropdownValue.value = selectDay;
    items.remove(selectDay);
    items.insert(0, selectDay);

    String filter;
    switch (selectDay) {
      case "Harian":
        filter = "today";
        break;
      case "7 Hari yang lalu":
        filter = "week";
        break;
      case "1 Bulan yang lalu":
        filter = "month";
        break;
      default:
        filter = "today";
        break;
    }

    // getSalesSummary(filter);
  }

}

List<String> getPastSevenDays() {
  final now = DateTime.now();
  final pastSevenDays = List<String>.generate(7, (index) {
    final day = now.subtract(Duration(days: index));
    return DateFormat('EEEE').format(day).toLowerCase();
  });
  return pastSevenDays.reversed.toList();
}

