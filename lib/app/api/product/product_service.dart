import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class ProductService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getAllProduct() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: 'http://ayamku-api.rplrus.com/api/products',
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> addProduct(FormData formData) async {
    try {
      final response = await _dioInstance.postImageRequest(
          endpoint: 'http://ayamku-api.rplrus.com/api/products',
          data: formData,
      );


      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateProduct(FormData formData, String id) async {
        try {
          final response = await _dioInstance.putRequest(
              endpoint: 'http://ayamku-api.rplrus.com/api/products/$id',
              data: formData,
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

  Future<Response> deleteProduct(String id) async {
        try {
          final response = await _dioInstance.deleteRequest(
              endpoint: 'http://ayamku-api.rplrus.com/api/products/$id',
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

  Future<Response> allProductTerlaris() async {
        try {
          final response = await _dioInstance.getRequest(
              endpoint: 'http://ayamku-api.rplrus.com/api/products/terlaris',
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }


}