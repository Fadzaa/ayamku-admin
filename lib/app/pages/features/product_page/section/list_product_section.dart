import 'package:ayamku_admin/app/pages/features/product_page/items/item_filter_list_product.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ListProductSection extends StatelessWidget {
  const ListProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("List product", style: txtHeadline3),

        SizedBox(height: 10,),

        CommonSearch(text: "Search"),

        SizedBox(height: 10,),

        ItemFilterListProduct(),

        SizedBox(height: 10,),

        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ItemListProductSection(
            image: sampleImage,
            cattegory: 'Geprek',
            name: 'PAHE Geprek',
            onPressed: () {  },
            price: 13000,
            stok: 45,
          )

        )

      ],
    );
  }
}

class ItemListProductSection extends StatelessWidget {
  const ItemListProductSection({
    super.key,
    required this.image,
    required this.cattegory,
    required this.name,
    required this.onPressed,
    required this.price,
    required this.stok
  });

  final String image, cattegory, name;
  final VoidCallback onPressed;
  final int price,stok;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
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

                  SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        // width: 63,
                        // height: 20,
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          cattegory,
                          style: txtCaption.copyWith(color: blackColor),
                        ),
                      ),

                      SizedBox(height: 5,),

                      Text(
                        name,
                        style: txtListItemTitle,
                      ),

                      SizedBox(height: 5,),

                      Row(
                        children: [

                          Text(
                            price.toString(),
                            style: txtCaption,
                          ),

                          SizedBox(width: 10,),

                          Text(
                            "•",
                            style: TextStyle(color: blackColor50),
                          ),

                          SizedBox(width: 10,),

                          Text(
                            stok.toString(),
                            style: txtCaption,
                          )

                        ],
                      )

                    ],
                  ),

                ],
              ),

              InkWell(
                onTap: onPressed,
                child: Text(
                  "Edit",
                  style: txtSecondaryTitle.copyWith(color: primaryColor),
                ),
              ),

            ],
          ),

          SizedBox(height: 5,),

          Divider(color: blackColor90, thickness: 0.5,)
        ],
      ),
    );
  }
}
