class OrderSummary {
  final String icon, title;
  final String count;
  final String? routes;


  OrderSummary({
    required this.icon,
    required this.title,
    required this.count,
    this.routes,
  });

}