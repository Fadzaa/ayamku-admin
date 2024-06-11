import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> filterStatus =[
  "Semua",
  "Menunggu persetujuan",
  "Dalam proses",
  "Dibatalkan"
];

List<String> typeOrder =[
  "onDelivery",
  "pickup"
];

final controller = Get.put(OrderPageController());

voidFilterAllOrder(BuildContext context) {
  showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter", style: txtHeadline3),
                  Text("Clear all", style: txtCaption.copyWith(color: primaryColor))
                ]
            ),

            SizedBox(height: 20,),

            FilterAllOrder(
                text: 'Status pemesanan',
                filterAllOrder: filterStatus,
                updateSelectedValue: controller.updateSelectedValue,
                selectedValue: controller.selectedValue,
            ),

            FilterAllOrder(
                text: 'Pos penjemputan',
                filterAllOrder: filterStatus,
                updateSelectedValue: controller.updateSelectedValue,
                selectedValue: controller.selectedValue,
            ),

            FilterAllOrder(
              text: 'Type order',
              filterAllOrder: typeOrder,
              updateSelectedValue: controller.updateSelectedValue,
              selectedValue: controller.selectedValue,
            ),

            SizedBox(height: 20,),

            CommonButton(
              height: 45,
                text: "Terapkan",
                onPressed: (){}
            )
          ],
          ),
        )
      )
  );
}

class FilterAllOrder extends StatelessWidget {
  const FilterAllOrder({
    super.key,
    required this.filterAllOrder,
    required this.updateSelectedValue,
    required this.selectedValue, required this.text
  });
  final String text;
  final List<String> filterAllOrder;
  final Function(String) updateSelectedValue;
  final String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: txtSecondaryTitle,),

          SizedBox(height: 5,),

          Wrap(
            spacing: 10,
            runSpacing: 3,
            children: List.generate(filterAllOrder.length, (index) {
              return InkWell(
                onTap: () {
                  updateSelectedValue(filterAllOrder[index]);
                },
                child: ChipTheme(
                  data: ChipTheme.of(context).copyWith(
                    side: BorderSide(
                      color: selectedValue == filterAllOrder[index]
                          ? primaryColor
                          : blackColor50,
                    ),
                  ),
                  child: Chip(
                    label: Text(
                      filterAllOrder[index],
                      style: txtCaption.copyWith(
                        color: selectedValue == filterAllOrder[index]
                            ? primaryColor
                            : blackColor,
                      ),
                    ),
                    backgroundColor: baseColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}