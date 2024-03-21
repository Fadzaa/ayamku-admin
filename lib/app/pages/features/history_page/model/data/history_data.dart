import 'package:ayamku_admin/app/pages/features/history_page/model/model/menu.dart';
import 'package:ayamku_admin/common/constant.dart';
import '../model/history.dart';

final List <History> history_data = [
  History(
      date: DateTime.monthsPerYear.toString(),
      menu: [
        Menu(
            image: sampleImage,
            username: "Fattah Anggit",
            orderFood: "Ayam Bakar",
            price: 20000,
            date: DateTime.monthsPerYear.toString()
        ),
        Menu(
            image: sampleImage,
            username: "Fattah Anggit",
            orderFood: "Ayam Bakar",
            price: 20000,
            date: DateTime.monthsPerYear.toString()
        ),
        Menu(
            image: sampleImage,
            username: "Fattah Anggit",
            orderFood: "Ayam Bakar",
            price: 20000,
            date: DateTime.monthsPerYear.toString()
        ),
      ]
  ),
  History(
      date: DateTime.monthsPerYear.toString(),
      menu: [
        Menu(
            image: sampleImage,
            username: "Fattah Anggit",
            orderFood: "Ayam Bakar",
            price: 20000,
            date: DateTime.monthsPerYear.toString()
        ),
      ]
  ),
];