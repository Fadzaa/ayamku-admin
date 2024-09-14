import 'dart:math';

import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProdukTerlarisSection extends GetView<ProductPageController> {
  const ProdukTerlarisSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Produk Review Teratas", style: txtHeadline3),
        SizedBox(
          height: 15,
        ),
        Obx(() => controller.isLoading.value
            ? Center(
                child: commonLoading(),
              )
            : ListView.builder(
                itemCount: min(3, controller.listTopReview.length),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = controller.listTopReview[index];
                  return ItemProdukTerlaris(
                    image: product.image.toString(),
                    nameMenu: product.name.toString(),
                    description: product.description.toString(),
                    price: formatCurrency.format(product.price ?? 0),
                    rating: product.rating_avg ?? 0,
                  );
                })),
      ],
    );
  }
}

class ItemProdukTerlaris extends StatelessWidget {
  const ItemProdukTerlaris({
    super.key,
    required this.image,
    required this.nameMenu,
    required this.description,
    required this.price,
    required this.rating,
  });

  final String image, nameMenu, description, price;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    fit: BoxFit.cover,
                    image,
                    width: 75,
                    height: 75,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      nameMenu,
                      style: txtListItemTitle,
                    ),

                    SizedBox(height: 5),

                    // Text(
                    //     description,
                    //   style: txtSecondaryTitle,
                    // )

                    Text(
                      price,
                      style: txtSecondaryTitle,
                    )
                  ],
                ),
              ],
            ),

            Row(
              children: [
                SvgPicture.asset(icStar),
                SizedBox(
                  width: 5,
                ),
                Text(
                  rating.toString(),
                  style: txtListItemTitle.copyWith(color: primaryColor),
                ),
              ],
            )

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //
            //     // Text(
            //     //   "+10%",
            //     //   style: txtSecondaryTitle.copyWith(color: greenLight),
            //     // ),
            //
            //     Text(
            //       price,
            //       style: txtSecondaryTitle,
            //     )
            //
            //   ],
            // )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: blackColor80,
          thickness: 0.5,
        )
      ],
    );
  }
}
