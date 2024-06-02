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

  Future<Response> addProduct(String name,String description,String price,String category,String stock,String image) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: 'http://ayamku-api.rplrus.com/api/products',
          data: {
            "name" : name,
            "description" : description,
            "price" : price,
            "category" : category,
            "stock" : stock,
            "image" : image
          }
      );

      Future<Response> updateProduct(String name,String description,String price,String category,String stock,String image,String id) async {
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

      Future<Response> deleteProduct(String name,String description,String price,String category,String stock,String image,String id) async {
        try {
          final response = await _dioInstance.deleteRequest(
              endpoint: 'http://ayamku-api.rplrus.com/api/products/$id',
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

      Future<Response> allProductTerlaris(String name,String description,String price,String category,String stock,String image) async {
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