import 'package:ayamku_admin/app/pages/features/product_page/items/item_filter_list_product.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductSection extends GetView<ProductPageController> {
  const ListProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductPageController controller = Get.put(ProductPageController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("List product", style: txtHeadline3),

        SizedBox(height: 10,),

        CommonSearch(text: "Search", controller: controller.searchController,),

        SizedBox(height: 10,),

        ItemFilterListProduct(),

        SizedBox(height: 10,),

        Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator(),)
            : ListView.builder(
            itemCount: controller.listProduct.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final product = controller.listProduct[index];
              return ItemListProductSection(
                image: product.image.toString(),
                category: product.category.toString(),
                name: product.name.toString(),
                price: product.price!,
                onPressed: () {
                  Get.toNamed(Routes.EDIT_PRODUCT_PAGE, arguments: product);
                },
              );
            }
        )),
      ],
    );
  }
}

class ItemListProductSection extends StatelessWidget {
  const ItemListProductSection({
    super.key,
    required this.image,
    required this.category,
    required this.name,
    required this.onPressed,
    required this.price,
  });

  final String image, category, name;
  final int price;
  final VoidCallback onPressed;

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
                  Image.network(
                    image,
                    width: 57,
                    height: 50,
                  ),

                  SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          category,
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

                          // Text(
                          //   stock.toString(),
                          //   style: txtCaption,
                          // ),
                        ],
                      ),
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