import 'package:ayamku_admin/app/pages/features/promo-page/model/promo.dart';
import 'package:get/get.dart';

RxList<Promo> promo_data = [
  Promo(
    name: "Christmas Sale",
    event: "Christmas",
    startDate: DateTime(2024, 12, 1),
    endDate: DateTime(2024, 12, 25),
    image: "https://th.bing.com/th/id/OIP.TOVHhdXTgD5bGxnqlklYmAAAAA?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  ),
  Promo(
    name: "New Year's Promotion",
    event: "New Year",
    startDate: DateTime(2024, 12, 26),
    endDate: DateTime(2025, 1, 1),
    image: "https://th.bing.com/th/id/OIP.TOVHhdXTgD5bGxnqlklYmAAAAA?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  ),
].obs;