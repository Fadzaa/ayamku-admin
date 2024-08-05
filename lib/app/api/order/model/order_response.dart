class OrderResponse {
  List<Order>? data;

  OrderResponse({this.data});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Order>[];
      json['data'].forEach((v) {
        data!.add(new Order.fromJson(v));
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

class Order {
  int? id;
  String? methodType;
  String? pickupTime;
  String? shiftDelivery;
  String? status;
  User? user;
  Cart? cart;
  Post? post;
  Voucher? voucher;
  int? discountAmount;
  int? finalAmount;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
        this.methodType,
        this.pickupTime,
        this.shiftDelivery,
        this.status,
        this.user,
        this.cart,
        this.post,
        this.voucher,
        this.discountAmount,
        this.finalAmount,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    methodType = json['method_type'];
    pickupTime = json['pickup_time'];
    shiftDelivery = json['shift_delivery'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    voucher =
    json['voucher'] != null ? new Voucher.fromJson(json['voucher']) : null;
    discountAmount = json['discount_amount'];
    finalAmount = json['final_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['method_type'] = this.methodType;
    data['pickup_time'] = this.pickupTime;
    data['shift_delivery'] = this.shiftDelivery;
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    if (this.voucher != null) {
      data['voucher'] = this.voucher!.toJson();
    }
    data['discount_amount'] = this.discountAmount;
    data['final_amount'] = this.finalAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? profilePicture;
  Null? phoneNumber;
  String? role;
  String? fcmToken;

  User(
      {this.id,
        this.name,
        this.email,
        this.profilePicture,
        this.phoneNumber,
        this.role,
        this.fcmToken});

  User.fromJson(Map<String, dynamic> json) {
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

class Cart {
  int? id;
  List<CartItems>? cartItems;

  Cart({this.id, this.cartItems});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cartItems'] != null) {
      cartItems = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cartItems != null) {
      data['cartItems'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int? id;
  int? productId;
  String? productName;
  int? quantity;
  String? price;
  int? totalPrice;

  CartItems(
      {this.id,
        this.productId,
        this.productName,
        this.quantity,
        this.price,
        this.totalPrice});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class Post {
  int? id;
  String? name;
  String? description;
  String? image;

  Post({this.id, this.name, this.description, this.image});

  Post.fromJson(Map<String, dynamic> json) {
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

class Voucher {
  int? id;
  String? code;
  int? discount;
  String? description;
  Null? qty;
  String? startDate;
  String? endDate;

  Voucher(
      {this.id,
        this.code,
        this.discount,
        this.description,
        this.qty,
        this.startDate,
        this.endDate});

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    discount = json['discount'];
    description = json['description'];
    qty = json['qty'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['qty'] = this.qty;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
