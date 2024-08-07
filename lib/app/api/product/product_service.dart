import 'package:dio/dio.dart'as dio;

import '../api_endpoint.dart';
import '../dio_instance.dart';

class ProductService {
  final DioInstance _dioInstance = DioInstance();

  Future<dio.Response> getAllProduct() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.product,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dio.Response> addProduct(formData) async {
    try {
      final response = await _dioInstance.postImageRequest(
          endpoint: ApiEndPoint.product,
          data: formData,
          isAuthorize: true
      );


      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dio.Response> updateProduct(String id,String name,String description,int price,String image,String category) async {
  try {
    final response = await _dioInstance.putRequest(
      endpoint: ApiEndPoint.updatePromo(id),
      isAuthorize: true,
      data: {
        "image": image,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
      },
    );

    return response;

  } catch (e) {
    throw Exception(e);
  }
}

  Future<dio.Response> deleteProduct(String id) async {
        try {
          final response = await _dioInstance.deleteRequest(
              endpoint: 'https://ayamku-api.rplrus.com/api/products/$id',
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }
      
  Future<dio.Response> getProductCategory({required String category}) async {
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

  Future<dio.Response> getProductSearch({required String search}) async {
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