import 'package:ayamku_admin/app/api/api_endpoint.dart';
import 'package:ayamku_admin/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class VoucherService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getAllVoucher() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.voucher,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}