import 'package:ayamku_admin/app/api/analytic/chart_revenue_response.dart';
import '../api_endpoint.dart';
import '../dio_instance.dart';

class ChartService {
  final DioInstance _dioInstance = DioInstance();

  Future<ChartRevenueResponse> getChartRevenue() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.analytic,
          isAuthorize: true
      );
      return ChartRevenueResponse.fromJson(response.data);

    } catch (e) {
      throw Exception(e);
    }
  }
}