import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ProdukTerlarisSection extends StatelessWidget {
  const ProdukTerlarisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Produk terlaris", style: txtHeadline3),

        SizedBox(height: 10,),

        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ItemProdukTerlaris(
            image: sampleImage,
            nameMenu: 'PAHE GEPREK',
            description: 'Nasi + Ayam Geprek + Teh',
            graph: 10,
            price: 13000,
          )

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

  final String image, nameMenu, description;
  final int graph, price;

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
                  "Rp.13.000",
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
