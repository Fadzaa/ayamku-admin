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

  Future<Response> getOrderMethodType( {required String method}) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.order,
        isAuthorize: true,
          queryParameters: {
            'method_type': method
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateOrderStatus( String id, String status) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint: ApiEndPoint.orderStatus,
        isAuthorize: true,
          data: {
            'order_id': id,
            'status': status,
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}