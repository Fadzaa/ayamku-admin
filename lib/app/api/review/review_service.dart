import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class ReviewService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getAllReview() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.getAllReview,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getReviewProductId(int productId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.getReviewProductId(productId),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}