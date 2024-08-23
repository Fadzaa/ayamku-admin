import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ItemPromoSection extends GetView<PromoPageController> {
  const ItemPromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Obx(() {
      if(controller.isLoading.value){
        return Center(
          child: commonLoading(),
        );
        
      }else if(controller.promosList.isEmpty){
        return Center(
          child: Text("Data Kosong"),
        );

        }else{
          return RefreshIndicator(
            onRefresh: () async {
              controller.getAllPromo();
            },
            child: ListView.builder(
              itemCount: controller.promosList.length,
              shrinkWrap: true,
              physics:  const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final promo = controller.promosList[index];

                print("TEST LIST PROMO");
                print(promo.name.toString());
                final startDate = DateFormat('dd MMMM yyyy')
                    .format(DateTime.parse(promo.startDate ?? ''));

                final endDate = DateFormat('dd MMMM yyyy')
                    .format(DateTime.parse(promo.endDate ?? ''));
                return ItemPromo(
                  name: promo.name.toString(),
                  event: promo.description.toString(),
                  image: promo.image.toString(),
                  startDate: startDate,
                  onPressed: () {
                    Get.toNamed(
                        Routes.EDIT_PROMO_PAGE,
                        arguments:
                        {
                          'id': promo.id.toString(),
                          'name':  promo.name.toString(),
                          'event':  promo.description.toString(),
                          'image': promo.image.toString(),
                          'discount': promo.discount,
                          'startDate': startDate,
                          'endDate': endDate
                        }
                        );
                  },
                );
              },
            ),
          );
      }
    });
  }
}


class ItemPromo extends StatelessWidget {
  const ItemPromo({
    super.key,
    required this.name,
    required this.event,
    required this.startDate,
    required this.image,
    required this.onPressed,
  });

  final String name;
  final String event;
  final String startDate;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          width: screenWidth,
          child: Column(
            children: [
              Image.network(
                image,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.2,
                width: screenWidth,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          name,
                          style: txtListItemTitle.copyWith(color: blackColor),
                        ),
                        Text(
                          startDate,
                          style: txtSecondaryTitle,
                        ),

                      ],
                    ),

                    SizedBox(height: 5),

                    Text(
                      event,
                      style: txtSecondaryTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}