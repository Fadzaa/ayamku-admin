import 'package:dio/dio.dart' as dio;

import '../api_endpoint.dart';
import '../dio_instance.dart';

class PosService {
  final DioInstance _dioInstance = DioInstance();

  Future<dio.Response> getAllPos() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.pos,
          isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dio.Response> addPos(formData) async {
    try {
      final response = await _dioInstance.postImageRequest(
          endpoint: ApiEndPoint.pos,
          data: formData,
          isAuthorize: true,
      );


      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

 Future<dio.Response> updatePos(formData, String id) async {
        try {
          final response = await _dioInstance.postImageRequest(
              endpoint: ApiEndPoint.updatePos(id),
              isAuthorize: true,
              data: formData
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

  Future<dio.Response> deletePos(String id) async {
        try {
          final response = await _dioInstance.deleteRequest(
              endpoint: 'https://ayamku-api.rplrus.com/api/posts/$id',
              isAuthorize: true,
          );
          
          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

  Future<dio.Response> searchPost(String search) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.pos,
        queryParameters: {
          'search': search,
        }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
  }