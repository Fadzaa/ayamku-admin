class Store {
  int? storeStatus;
  String? description;

  Store({this.storeStatus, this.description});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      storeStatus: json['store_status'],
      description: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'store_status': storeStatus,
      'message': description,
    };
  }
}
