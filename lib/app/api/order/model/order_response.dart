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
  String? status;
  User? user;
  Cart? cart;
  Post? post;

  Order(
      {this.id, this.methodType, this.status, this.user, this.cart, this.post});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    methodType = json['method_type'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['method_type'] = this.methodType;
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

  User(
      {this.id,
        this.name,
        this.email,
        this.profilePicture,
        this.phoneNumber,
        this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profile_picture'];
    phoneNumber = json['phone_number'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_picture'] = this.profilePicture;
    data['phone_number'] = this.phoneNumber;
    data['role'] = this.role;
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
  double? totalPrice;

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
    totalPrice = (json['total_price'] as num).toDouble();
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
