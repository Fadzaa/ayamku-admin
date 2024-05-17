import 'package:ayamku_admin/app/pages/features/history_page/history_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/history_page/items/item_order_today_vertical.dart';
import 'package:ayamku_admin/app/pages/features/history_page/model/data/history_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/theme.dart';


class HistoryPageView extends GetView<HistoryPageController> {
  const HistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed: () {
            // Tambahkan aksi ketika tombol arrow left diklik
         },
      ),
        title: Row(
          children: [
            Text(
              "History ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
          ],
        )
      ),
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
                        const Text("Delivery"),
                        const SizedBox(width: 10,),

                        history_data.length > 0 ? Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle
                          ),

                        ) : Container()
                      ],
                    )),
                    
                    Tab(text: "PickUp "),
                  ]
              ),

              const SizedBox(height: 20,),

              Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children:  const [

                      OrderDeliveryView(),

                      OrderPickupView(),
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

class OrderDeliveryView extends StatelessWidget {
  const OrderDeliveryView({super.key});

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

                const SizedBox(height: 20,),

                ListView.builder(
                    itemCount: history_data[index].menu.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, indexMenu) =>

                        ItemHistoryTodayVertical()
                ),

                Text("Yesterday", style: txtHeadline3),

                const SizedBox(height: 20,),
                ListView.builder(
                    itemCount: history_data[index].menu.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, indexMenu) =>

                        ItemHistoryYesterdayVertical()
                ),

                const SizedBox(height: 20,)
              ],
            )
    );
  }
}

class OrderPickupView extends StatelessWidget {
  const OrderPickupView({super.key});

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
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, indexMenu) =>
                        ItemHistoryTodayVertical(
                          
                        )
                ),
                const SizedBox(height: 20,)
              ],
            )
    );
  }
}







