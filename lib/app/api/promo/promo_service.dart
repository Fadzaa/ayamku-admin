import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class PromoService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getAllPromo() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.promo,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> addPromo(formData) async {
    try {
      final response = await _dioInstance.postImageRequest(
          endpoint: ApiEndPoint.promo,
          data: formData,
          isAuthorize: true,
      );


      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

 Future<Response> updatePromo(String name,String description,String id, String discount, String start_date, String end_date, String image) async {
        try {
          final response = await _dioInstance.putRequest(
              endpoint: ApiEndPoint.updatePromo(id),
              isAuthorize: true,
              data: {
                "name" : name,
                "description" : description,
                "discount" : discount,
                "start_date" : start_date,
                "end_date" : end_date,
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
              endpoint: 'https://ayamku-api.rplrus.com/api/promos/$id',
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

  Future<Response> activePromo(String name,String description,String price,String category,String stock,String image) async {
        try {
          final response = await _dioInstance.getRequest(
              endpoint: 'https://ayamku-api.rplrus.com/api/promos/terlaris',
          );

          return response;
        } catch (e) {
          throw Exception(e);
        }
      }

  Future<Response> getPromoSearch({required String search}) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.promo,
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