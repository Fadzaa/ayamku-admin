import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class ProductService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getAllProduct() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.product,
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
  Future<Response> getProductCategory({required String category}) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.product,
          isAuthorize: true,
          queryParameters: {
            'category': category
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getProductSearch({required String search}) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.product,
          isAuthorize: true,
          queryParameters: {
            'search': search
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }



}