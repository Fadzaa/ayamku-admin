import 'package:ayamku_admin/app/pages/features/pos_page/pos_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemFilterSelectPos extends GetView<PosPageController> {
  const ItemFilterSelectPos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> filter_pos = ["Semua", "Pilih kelas", "Pilih jurusan"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
        children: List.generate(filter_pos.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: (){
                controller.updateSelectedValue(filter_pos[index]);
              },
              child: ChipTheme(
                data: ChipTheme.of(context).copyWith(
                  side: controller.selectedValue.value == filter_pos[index]
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey),
                ),
                child: Chip(
                  label: Row(
                    children: [
                      Text(filter_pos[index],
                        style: txtCaption.copyWith(color: blackColor),
                      ),
                      if (filter_pos[index] == "Pilih kelas" || filter_pos[index] == "Pilih jurusan")
                        Row(children: [
                          SizedBox(width: 5),
                          SvgPicture.asset(
                            icDown,
                          ),
                        ]),
                    ],
                  ),

                  backgroundColor: controller.selectedValue.value == filter_pos[index] ? primaryColor : baseColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
