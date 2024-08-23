import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class OrderService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getOrder() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.order,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getOrderLatest(String? methodType) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.orderLatest,
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

  Future<Response> updateOrderStatus(int id, String status) async {

    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.orderStatus,
        isAuthorize: true,
        data: {
          'order_id': id,
          'status': status,
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}