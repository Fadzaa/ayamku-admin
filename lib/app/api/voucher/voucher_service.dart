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

  Future<dio.Response> updateVoucher(String id, Map<String, String> formData) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint: ApiEndPoint.updateVoucher(id),
        data: formData,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dio.Response> addVoucher( formData) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.voucher,
        data: formData,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}