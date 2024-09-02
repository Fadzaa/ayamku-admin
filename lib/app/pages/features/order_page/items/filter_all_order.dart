import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> filterStatus = [
  "Semua",
  "Dalam proses",
  "Selesai",
  "Telah Diterima",
  "Dibatalkan",
];

List<String> post = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
];

List<String> typeOrder = ["Semua", "OnDelivery", "Pickup"];

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
            height:360,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Filter", style: txtHeadline3),
                      InkWell(
                          onTap: () {
                            controller.clearFilters();
                          },
                          child: Text("Clear all",
                              style: txtCaption.copyWith(color: primaryColor)))
                    ]),
                SizedBox(
                  height: 10,
                ),
                WidgetFilter(
                  text: 'Status pemesanan',
                  filterAllOrder: filterStatus,
                  updateSelectedValue: (filterStatus) {
                    controller.updateSelectedStatus(filterStatus);
                  },
                  selectedValue: controller.selectedStatusDisplay,
                ),
                // WidgetFilter(
                //   text: 'Pos penjemputan',
                //   filterAllOrder: post,
                //   updateSelectedValue: controller.updateSelectedValue,
                //   selectedValue: controller.selectedValue,
                // ),
                WidgetFilter(
                  text: 'Type order',
                  filterAllOrder: typeOrder,
                  updateSelectedValue: (typeOrder) {
                    controller.selectedFilterTypeOrder.value = typeOrder;
                    controller.applyAllFilters();
                  },
                  selectedValue: controller.selectedFilterTypeOrder,
                ),
                SizedBox(
                  height: 10,
                ),
                CommonButton(
                  height: 30,
                  text: "Terapkan",
                  onPressed: () async {
                    await controller.applyAllFilters();
                    Navigator.pop(context);
                  },
                )

              ],
            ),
          )));
}

class WidgetFilter extends StatelessWidget {
  const WidgetFilter({
    Key? key,
    required this.filterAllOrder,
    required this.updateSelectedValue,
    required this.selectedValue,
    required this.text
  }) : super(key: key);

  final String text;
  final List<String> filterAllOrder;
  final Function(String) updateSelectedValue;
  final RxString selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: txtSecondaryTitle,
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 3,
            children: List.generate(filterAllOrder.length, (index) {
              return Obx(() => InkWell(
                onTap: () {
                  updateSelectedValue(filterAllOrder[index]);
                },
                child: ChipTheme(
                  data: ChipTheme.of(context).copyWith(
                    side: BorderSide(
                      color: selectedValue.value == filterAllOrder[index]
                          ? primaryColor
                          : blackColor50,
                    ),
                  ),
                  child: Chip(
                    label: Text(
                      filterAllOrder[index],
                      style: txtCaption.copyWith(
                        color: selectedValue.value == filterAllOrder[index]
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
              ));
            }),
          ),
        ],
      ),
    );
  }
}
