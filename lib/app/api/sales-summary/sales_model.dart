class SalesResponse {
  int? sales;
  int? totalSales;
  int? totalProduct;

  SalesResponse({this.sales, this.totalSales, this.totalProduct});

  SalesResponse.fromJson(Map<String, dynamic> json) {
    sales = json['sales'];
    totalSales = json['total_sales'];
    totalProduct = json['total_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sales'] = this.sales;
    data['total_sales'] = this.totalSales;
    data['total_product'] = this.totalProduct;
    return data;
  }
}
