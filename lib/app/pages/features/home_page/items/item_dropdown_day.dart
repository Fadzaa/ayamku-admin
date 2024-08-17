import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDropdownDay extends GetView<HomePageController> {
  const ItemDropdownDay({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final List<String> day_select = ["Hari ini", "7 Hari yang lalu", "1 Bulan yang lalu"];


    return Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 145,
        decoration: BoxDecoration(
            border: Border.all(color: blackColor50, width: 0.5),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Obx(() => DropdownButton(
          dropdownColor: Colors.white,
          style: txtCaption.copyWith(color: blackColor),
          elevation: 1,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          borderRadius: BorderRadius.circular(8),
          underline: Container(),
          items: day_select.map((String day) => DropdownMenuItem(child: Text(day), value: day,)).toList(),
          onChanged: (value) =>  controller.onChangeValue(value ?? "Hari ini", day_select),
          value: controller.dropdownValue.value,
        ),)
    );
  }
}
