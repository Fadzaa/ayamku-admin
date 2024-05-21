import 'package:ayamku_admin/common/theme.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class Stats{
  final int index,orders;
  final DateTime dateTime;
  charts.Color? barColor;

  Stats({
    required this.index,
    required this.orders,
    required this.dateTime,
    this.barColor,
  }){
    barColor = charts.ColorUtil.fromDartColor(primaryColor);
  }
}