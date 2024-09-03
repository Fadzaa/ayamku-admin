import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class StoreService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> updateStore() async {
    try {
      final response = await _dioInstance.updateStore(
        endpoint: ApiEndPoint.store,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getStatusStore() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.store,
        isAuthorize: true
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}