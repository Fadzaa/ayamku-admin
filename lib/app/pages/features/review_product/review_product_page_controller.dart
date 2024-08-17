import 'package:ayamku_admin/app/api/review/model/review_response.dart';
import 'package:ayamku_admin/app/api/review/review_service.dart';
import 'package:ayamku_admin/app/pages/features/review_product/model/rating_model.dart';
import 'package:get/get.dart';

class ReviewProductPageController extends GetxController {

  RxList<RatingModel> rating_model_data = RxList<RatingModel>();
  ReviewService reviewService = ReviewService();
  ReviewResponse reviewResponse = ReviewResponse();
  List<ListCustomerReviews> listCustomer = <ListCustomerReviews>[];

  var arguments = Get.arguments;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    reviewService = ReviewService();
    int id = Get.arguments;

    if (id != null && id > 0) {
      getReviewProduct(id);
    }
  }

  Future getReviewProduct(int id) async {
    try {
      print('value id = ' + id.toString());
      isLoading.value = true;

      final response = await reviewService.getReviewProductId(id);
      listCustomer.clear();

      reviewResponse = ReviewResponse.fromJson(response.data);

      print("CHECK RESPONSE ID");
      print(response.data);
      listCustomer.addAll(reviewResponse.listCustomerReviews ?? []);

    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}