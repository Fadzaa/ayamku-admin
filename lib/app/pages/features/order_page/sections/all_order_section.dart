import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/item_order_vertical.dart';
import 'package:ayamku_admin/app/pages/features/order_page/items/filter_all_order.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllOrderSection extends GetView<OrderPageController> {
  const AllOrderSection({super.key});

  @override
  Widget build(BuildContext context) {

    // List<String> listOrder = [
    //   "On Delivery",
    //   "Pickup"
    // ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            //   decoration: BoxDecoration(
            //     color: primaryColor,
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: Text("09.40", style: txtCaption)
            // ),
            //
            // SizedBox(width: 10,),

            Text("List Order", style: txtHeadline3),

            Spacer(),

            InkWell(
              onTap: () => voidFilterAllOrder(context),
                child: SvgPicture.asset(icFilter)
            )
          ]
        ),

        const SizedBox(height: 5,),

        // SizedBox(
        //   height: 30,
        //   child: ListView.builder(
        //       itemCount: listOrder.length,
        //       scrollDirection: Axis.horizontal,
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemBuilder: (context, index) =>
        //           Obx(() => ChipOrder(
        //               text: listOrder[index],
        //               totalOrder: 2,
        //               index: index,
        //               isSelected: controller.currentIndex.value == index
        //           ))
        //   ),
        // ),

        const SizedBox(height: 20,),

        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ItemOrderVertical(
              orderName: "PAHE GEPREK",
              orderPrice: 20000,
              orderStatus: OrderStatus.done,
              orderTime: DateTime.now(),
              username: "Fattah Anggit",
            ),

        )


      ],
    );
  }
}

// class ChipOrder extends GetView<HomePageController> {
//   const ChipOrder({
//     super.key,
//     required this.text,
//     required this.totalOrder,
//     required this.isSelected,
//     required this.index
//   });
//
// final String text;
// final int totalOrder, index;
// final bool isSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       splashColor: Colors.transparent,
//       onTap: () => controller.changeIndex(index),
//       child: Container(
//         height: 40,
//         margin: const EdgeInsets.only(right: 10),
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: isSelected ? primaryColor : Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: isSelected ? null : Border.all(color: blackColor50, width: 1)
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(text, style: txtCaption.copyWith(
//                 color: Colors.black
//             ),),
//
//             const SizedBox(width: 5,),
//
//             totalOrder > 0 && isSelected
//             ? Container(
//               width: 20,
//               height: 20,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Text(totalOrder.toString(), style: txtCaption.copyWith(
//                     color: Colors.black
//                 ),),
//               ),
//             )
//             : const SizedBox()
//           ],
//         )
//       ),
//     );
//   }
// }

