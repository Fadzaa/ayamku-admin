import 'package:ayamku_admin/app/pages/features/history_page/history_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/history_page/items/item_order_vertical.dart';
import 'package:ayamku_admin/app/pages/features/history_page/model/data/history_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/theme.dart';


class HistoryPageView extends GetView<HistoryPageController> {
  const HistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                  indicatorColor: primaryColor,
                  labelColor: primaryColor,
                  unselectedLabelColor: const Color(0xFF707070).withOpacity(0.7),
                  labelStyle: txtButtonTab,
                  unselectedLabelStyle: txtButtonTab,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  labelPadding: const EdgeInsets.only(right: 20),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  isScrollable: true,
                  controller: controller.tabController,
                  tabs:  [
                    Tab(child: Row(
                      children: [
                        const Text("Selesai"),
                        const SizedBox(width: 10,),
                        history_data.length > 0 ? Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle
                          ),
                          child: Center(child: Text(history_data.length.toString(), style: txtNavbar.copyWith(color: Colors.white),)),
                        ) : Container()
                      ],
                    )),
                    Tab(text: "Sedang Dipesan"),
                  ]
              ),

              const SizedBox(height: 20,),

              Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children:  const [
                      OrderCompleteView(),
                      OrderCompleteView(),
                    ]
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

class OrderCompleteView extends StatelessWidget {
  const OrderCompleteView({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: history_data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index) =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today", style: txtHeadline3),

                const SizedBox(height: 10,),

                ListView.builder(
                    itemCount: history_data[index].menu.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, indexMenu) =>
                        ItemHistoryVertical(
                          username: history_data[index].menu[indexMenu].username,
                          orderTime: history_data[index].menu[indexMenu].date,
                          orderStatus: OrderStatus.done,
                          orderPrice: history_data[index].menu[indexMenu].price,
                          orderName: history_data[index].menu[indexMenu].orderFood,
                        )
                ),
                const SizedBox(height: 20,)
              ],
            )
    );
  }
}









