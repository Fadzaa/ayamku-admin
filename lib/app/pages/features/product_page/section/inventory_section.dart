import 'package:ayamku_admin/app/pages/features/product_page/items/item_dropdown_day.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class InventorySection extends StatelessWidget {
  const InventorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Inventory overview", style: txtHeadline3),

            ItemDropdownDay()
          ],
        ),

        SizedBox(height: 10,),

        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: blackColor80)
          ),
          child: Column(
            children: [

              ContainerStok(
                  color: orange,
                  text: "Stok received",
                  quantity: 200
              ),

              SizedBox(height: 15,),

              ContainerStok(
                  color: green,
                  text: "Stok available",
                  quantity: 50
              ),

              SizedBox(height: 15,),

              ContainerStok(
                  color: blue,
                  text: "Stok sold",
                  quantity: 150
              ),


            ],
          ),
        ),

      ],
    );
  }
}

class ContainerStok extends StatelessWidget {
  const ContainerStok({
    super.key,
    required this.color,
    required this.text,
    required this.quantity
  });

  final String text;
  final Color color;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [

                Container(
                  width: 20,
                  height: 17,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5),
                  ),
                ),

                SizedBox(width: 10,),

                Text(
                    text,
                  style: txtSecondaryTitle.copyWith(color: blackColor40),
                )

              ],
            ),

            Text(
              quantity.toString(),
              style: txtSecondaryTitle.copyWith(color: blackColor),
            )

          ],
        ),
        Divider(color: blackColor90,)
      ],
    );
  }
}

