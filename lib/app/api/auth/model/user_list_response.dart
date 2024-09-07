class UserListResponse {
  List<Data>? data;

  UserListResponse({this.data});

  UserListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? name;
  String? email;
  String? profilePicture;
  String? phoneNumber;
  String? role;
  String? fcmToken;

  Data(
      {this.id,
        this.name,
        this.email,
        this.profilePicture,
        this.phoneNumber,
        this.role,
        this.fcmToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profile_picture'];
    phoneNumber = json['phone_number'];
    role = json['role'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_picture'] = this.profilePicture;
    data['phone_number'] = this.phoneNumber;
    data['role'] = this.role;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}
