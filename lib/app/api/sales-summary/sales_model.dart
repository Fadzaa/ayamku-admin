class SalesResponse {
  String? totalSales;
  int? totalOrder;
  int? totalProduct;

  SalesResponse({this.totalSales, this.totalOrder, this.totalProduct});

  SalesResponse.fromJson(Map<String, dynamic> json) {
    totalSales = json['total_sales'];
    totalOrder = json['total_order'];
    totalProduct = json['total_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_sales'] = this.totalSales;
    data['total_order'] = this.totalOrder;
    data['total_product'] = this.totalProduct;
    return data;
  }
}
