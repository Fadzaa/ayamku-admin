import 'package:ayamku_admin/app/pages/features/voucher_management/model/voucher.dart';
import 'package:get/get.dart';

RxList<Voucher> voucher_data = [
  Voucher(
    name: "Diskon makan",
    startDate: DateTime(2024, 12, 1),
    endDate: DateTime(2024, 12, 25),
    qty: 10,
    description: "Diskon makan",
  ),
].obs;