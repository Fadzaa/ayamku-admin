import 'package:ayamku_admin/app/pages/features/review_product/review_product_page_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../api/review/model/review_response.dart';
import '../items/items_user_review.dart';

class UserReviewSection extends GetView<ReviewProductPageController> {
  const UserReviewSection({
    super.key,
    required this.listCustomer,
  });

  final List<ListCustomerReviews> listCustomer;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Customer review", style: txtHeadline3),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: screenHeight,
          child: SizedBox(
              height: screenHeight,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: commonLoading());
                } else if (controller.listCustomer.isEmpty) {
                  return Center(
                    child: NotFoundPage(
                      image: notFound,
                      title: 'Data tidak ditemukan',
                      subtitle: 'Silahkan cari data lainnya',
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.listCustomer.length,
                    itemBuilder: (context, index) {
                      final customer = controller.listCustomer[index];
                      return ItemsUserReview(
                        name: customer.userName!,
                        date: DateFormat('yyyy MMMM dd').format(
                            DateTime.parse(customer.createdAt!)),
                        comment: customer.comment,
                        rating: customer.rating!,
                      );
                    },
                  );
                }
              })),
        ),
      ],
    );
  }
}
