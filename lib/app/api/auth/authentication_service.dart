import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: 'http://ayamku-api.rplrus.com/api/users/login',
          data: {
            'email': email,
            'password': password
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}