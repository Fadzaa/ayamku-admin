import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemFilterListProduct extends StatelessWidget {
  const ItemFilterListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> filterList = [
      "All",
      "Geprek",
      "Ricebowl",
      "Snack",
      "Minuman",
    ];
    final ProductPageController controller = Get.put(ProductPageController());

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
        children: List.generate(filterList.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                controller.updateSelectedValue(filterList[index]);
                if (filterList[index] == "All") {
                  controller.getAllProduct();
                } else {
                  controller.getProductCategory(filterList[index]);
                }
              },
              child: ChipTheme(
                data: ChipTheme.of(context).copyWith(
                  side: controller.selectedValue.value == filterList[index]
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey),
                ),
                child: Chip(
                  label: Text(filterList[index],
                    style: txtCaption.copyWith(color: blackColor),
                  ),
                  backgroundColor: controller.selectedValue.value == filterList[index] ? primaryColor : baseColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          );
        }),
      )),
    );
  }
}
