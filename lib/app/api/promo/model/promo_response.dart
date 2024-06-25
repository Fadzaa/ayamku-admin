class PromoResponse {
  List<Promo>? data;

  PromoResponse({this.data});

  PromoResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Promo>[];
      json['data'].forEach((v) {
        data!.add(new Promo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promo {
  String? name;
  String? description;
  String? startDate;
  String? endDate;
  String? image;

  Promo(
      {this.name, this.description, this.startDate, this.endDate, this.image});

  Promo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['image'] = this.image;
    return data;
  }
}