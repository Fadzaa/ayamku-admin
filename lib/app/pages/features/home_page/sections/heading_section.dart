import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:ayamku_admin/app/pages/features/home_page/items/item_manage_horizontal.dart';
import 'package:ayamku_admin/app/pages/features/home_page/model/manage_data.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../common/theme.dart';

class HeadingSection extends GetView<HomePageController> {
  const HeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InkWell(
          onTap: () =>  Get.offNamedUntil(Routes.ORDER_PAGE, (route) => route.settings.name == Routes.HOME_PAGE),
          child: Container(
            height: 65,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: primaryColor80,
                borderRadius: BorderRadius.circular(16)
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child:Obx(() => Text("${controller.listLatestOrder.length}", style: txtListItemTitle.copyWith(color: Colors.white),))
                      ),
                    ),

                    const SizedBox(width: 10,),

                    Row(
                      children: [
                        Text("Pesanan baru", style: txtListItemTitle),

                        const SizedBox(width: 5),

                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                                color: greenMedium,
                                shape: BoxShape.circle
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                Row(
                  children: [
                    Text("atur pesanan", style: txtCaption.copyWith(
                        color: blackColor50
                    ),),

                    const SizedBox(width: 5),

                    const Icon(Icons.arrow_forward_ios, color: blackColor50, size: 16,)
                  ],
                )
              ],
            ),
          ),
        ),

        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.of(manage_data.map((e) => ItemManageHorizontal(image: e.image, name: e.name,routes: e.routes,)))
          ],
        ),
      ],
    );
  }
}
