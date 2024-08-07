class PosResponse {
  List<Pos>? data;

  PosResponse({this.data});

  PosResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Pos>[];
      json['data'].forEach((v) {
        data!.add(new Pos.fromJson(v));
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

class Pos {
  int? id;
  String? name;
  String? description;
  String? image;

  Pos({this.id, this.name, this.description, this.image});

  Pos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
