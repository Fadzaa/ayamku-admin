import 'dart:math';

import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProdukTerlarisSection extends GetView<ProductPageController> {
  const ProdukTerlarisSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Produk Review Teratas", style: txtHeadline3),

        SizedBox(height: 10,),

        ListView.builder(
            itemCount: min(3, controller.listTopReview.length),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final product = controller.listTopReview[index];
            return ItemProdukTerlaris(
              image: product.image.toString(),
              nameMenu: product.name.toString(),
              description: product.description.toString(),
              graph: 2,
              price: formatCurrency.format(product.price ?? 0),
            );
          }

        )


      ],
    );
  }
}

class ItemProdukTerlaris extends StatelessWidget {
  const ItemProdukTerlaris ({
    super.key,
    required this.image,
    required this.nameMenu,
    required this.description,
    required this.graph,
    required this.price
  });

  final String image, nameMenu, description,price;
  final int graph;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 57,
                  height: 50,
                ),

                SizedBox(width: 15,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text(
                      nameMenu,
                      style: txtSecondaryTitle,
                    ),

                    Text(
                        description,
                      style: txtSecondaryTitle,
                    )

                  ],
                ),



              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text(
                  "+10%",
                  style: txtSecondaryTitle.copyWith(color: greenLight),
                ),

                Text(
                  price,
                  style: txtSecondaryTitle,
                )

              ],
            )
          ],
        ),

        SizedBox(height: 5,),

        Divider(color: blackColor80, thickness: 0.5,)
      ],
    );
  }
}
