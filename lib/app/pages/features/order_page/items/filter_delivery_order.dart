import 'package:ayamku_admin/app/pages/features/order_page/items/filter_all_order.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

voidDeliveryOrder(BuildContext context) {
  showModalBottomSheet(
    // isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 420,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
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
                          child: Text("Clear all", style: txtCaption.copyWith(color: primaryColor)))
                    ]
                ),

                SizedBox(height: 15,),

                WidgetFilter(
                  text: 'Status pemesanan',
                  filterAllOrder: filterStatus,
                  updateSelectedValue: (filterStatus) {
                    controller.updateSelectedStatus(filterStatus);
                  },
                  selectedValue: controller.selectedStatusDisplay,
                ),

                WidgetFilter(
                  text: 'Pos penjemputan',
                  filterAllOrder: filterStatus,
                  updateSelectedValue: controller.updateSelectedValue,
                  selectedValue: controller.selectedValue,
                ),

                SizedBox(height: 5,),

                CommonButton(
                    height: 45,
                    text: "Terapkan",
                    onPressed: () async {
                      controller.deliveryFilters();
                      Navigator.pop(context);
                    }
                )
              ],
            ),
          )
      )
  );
}