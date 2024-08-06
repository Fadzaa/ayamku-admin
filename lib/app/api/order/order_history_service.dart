import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class OrderHistoryService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getOrderMethodType(String methodType) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.orderHistories,
        isAuthorize: true,
        queryParameters: {
          'method_type': methodType
        }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}