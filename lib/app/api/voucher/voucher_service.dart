import 'dart:convert';

import 'package:ayamku_admin/app/api/api_endpoint.dart';
import 'package:ayamku_admin/app/api/dio_instance.dart';
import 'package:dio/dio.dart' as dio;

class VoucherService {
  final DioInstance _dioInstance = DioInstance();

  Future<dio.Response> getAllVoucher() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.voucher,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dio.Response> updateVoucher(String id, String code, int discount,
      String description, String startDate, String endDate) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.updateVoucher(id),
         isAuthorize: true, data: {
        'code': code,
        'discount': discount,
        'description': description,
        'start_date': startDate,
        'end_date': endDate
      });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dio.Response> addVoucher(formData) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.voucher,
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dio.Response> deleteVoucher(String id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: "https://ayamku-api.rplrus.com/api/vouchers/$id",
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}