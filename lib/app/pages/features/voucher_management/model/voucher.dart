class Voucher {
  final String name;
  final int qty;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  Voucher({
    required this.name,
    required this.qty,
    required this.description,
    required this.startDate,
    required this.endDate,
  });
}
