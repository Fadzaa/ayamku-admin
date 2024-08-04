import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String email, String password, String fcmToken) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.login,
          data: {
            'email': email,
            'password': password,
            'fcm_token': fcmToken
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}