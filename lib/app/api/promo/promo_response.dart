import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class ProductService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getAllPromo() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: 'http://ayamku-api.rplrus.com/promos?search=',
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> addPromo(FormData formData) async {
    try {
      final response = await _dioInstance.postImageRequest(
          endpoint: 'http://ayamku-api.rplrus.com/api/products',
          data: formData,
      );

      Future<Response> updatePromo(String name,String description,String price,String category,String stock,String image,String id) async {
        try {
          final response = await _dioInstance.putRequest(
              endpoint: 'http://ayamku-api.rplrus.com/api/products/$id',
              data: {
                "name" : name,
                "description" : description,
                "price" : price,
                "category" : category,
                "stock" : stock,
                "image" : image
              }
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

      Future<Response> deletePromo(String name,String description,String price,String category,String stock,String image,String id) async {
        try {
          final response = await _dioInstance.deleteRequest(
              endpoint: 'http://ayamku-api.rplrus.com/api/products/$id',
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

      Future<Response> allPromo(String name,String description,String price,String category,String stock,String image) async {
        try {
          final response = await _dioInstance.getRequest(
              endpoint: 'http://ayamku-api.rplrus.com/api/products/terlaris',
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }



      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}