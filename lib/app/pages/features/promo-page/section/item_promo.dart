import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ItemPromoSection extends StatelessWidget {
  const ItemPromoSection({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PromoPageController());

    return ListView.builder(
      itemCount: controller.promosList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final promo = controller.promosList[index];
        final startDate = DateFormat('dd MMMM yyyy').format(promo.startDate);
        return ItemPromo(
          name: promo.name,
          event: promo.event,
          image: promo.image,
          startDate: startDate,
          onPressed: () {
            Get.toNamed(Routes.EDIT_PROMO_PAGE, arguments: {'index': index, 'startDate': promo.startDate, 'endDate': promo.endDate});
          },
        );
      },
    );
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
    double screenWIdth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (){
        Get.toNamed(Routes.EDIT_PROMO_PAGE);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      name,
                      style: txtListItemTitle,
                    ),

                    SizedBox(height: 5),

                    Text(
                      startDate,
                      style: txtSecondaryTitle.copyWith(color: blackColor40),
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    event,
                    style: txtSecondaryTitle.copyWith(color: blackColor40),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(
                image,
                width: screenWIdth,
              ),
            ),


            Divider(color: blackColor90,)
          ],
        ),
      ),
    );
  }
}

