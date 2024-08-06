import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class SalesService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getSaleSummary(String filter) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.salesSummary,
        isAuthorize: true,
        queryParameters: {
          'filter': filter
        }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}