import 'package:ayamku_admin/app/pages/features/product_page/items/item_filter_list_product.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListProductSection extends GetView<ProductPageController> {
  const ListProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductPageController controller = Get.put(ProductPageController());
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("List product", style: txtHeadline3),
        SizedBox(
          height: 10,
        ),
        CommonSearch(
          text: "Search",
          controller: controller.searchController,
        ),
        SizedBox(
          height: 10,
        ),
        ItemFilterListProduct(),
        SizedBox(
          height: 10,
        ),
        Obx(() => controller.isLoading.value
            ? Center(
                child: commonLoading(),
              )
            : ListView.builder(
                itemCount: controller.listProduct.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = controller.listProduct[index];
                  return ItemListProductSection(
                    tapReview: () {
                      Get.toNamed(Routes.REVIEW_PAGE, arguments: product.id);
                    },
                    image: product.image.toString(),
                    category: product.category.toString(),
                    name: product.name.toString(),
                    price: formatCurrency.format(product.price ?? 0),
                    edit: () {
                      Get.toNamed(Routes.EDIT_PRODUCT_PAGE, arguments: product);
                    },
                    rating: product.rating_avg ?? 0,
                    totalRating: product.totalRating ?? 0,
                  );
                })),
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
    required this.edit,
    required this.price,
    required this.tapReview,
    required this.rating,
    required this.totalRating,
  });

  final String image, category, name;
  final String price;
  final VoidCallback edit, tapReview;
  final int rating;
  final int totalRating;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: edit,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
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
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            category,
                            style: txtCaption.copyWith(color: blackColor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: screenWidth * 0.4,
                          child: Text(
                            name,
                            style: txtListItemTitle,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              price,
                              style: txtCaption,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              ".",
                              style: txtListItemTitle,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: primaryColor,
                            ),
                            Text(rating.toString()),
                            SizedBox(width: 5),
                            Text("($totalRating)".toString()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: tapReview,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: primaryColor),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(icStar),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Review",
                            style:
                                txtSecondaryTitle.copyWith(color: primaryColor),
                          )
                        ],
                      )),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: blackColor90,
              thickness: 0.5,
            )
          ],
        ),
      ),
    );
  }
}
