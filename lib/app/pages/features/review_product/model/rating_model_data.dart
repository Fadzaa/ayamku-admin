import 'package:ayamku_admin/app/pages/features/review_product/model/rating_model.dart';
import 'package:get/get.dart';

final rating_model_data = <RatingModel>[
  RatingModel(
    stars: 5,
    count: 10,
  ),
  RatingModel(
    stars: 4,
    count: 5,
  ),
  RatingModel(
    stars: 3,
    count: 3,
  ),
  RatingModel(
    stars: 2,
    count: 2,
  ),
  RatingModel(
    stars: 1,
    count: 1,
  ),
].obs;