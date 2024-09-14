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
  String? id;
  String? methodType;
  String? paymentMethod;
  String? pickupTime;
  String? shiftDelivery;
  String? status;
  User? user;
  Cart? cart;
  Post? post;
  String? voucher;
  List<dynamic>? reviews;
  int? originalAmount;
  int? discountAmount;
  int? finalAmount;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
        this.methodType,
        this.paymentMethod,
        this.pickupTime,
        this.shiftDelivery,
        this.status,
        this.user,
        this.cart,
        this.post,
        this.voucher,
        this.reviews,
        this.originalAmount,
        this.discountAmount,
        this.finalAmount,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    methodType = json['method_type'];
    paymentMethod = json['payment_method'];
    pickupTime = json['pickup_time'];
    shiftDelivery = json['shift_delivery'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    voucher = json['voucher'];
    if (json['reviews'] != null) {
      reviews = <Null>[];
      json['reviews'].forEach((v) {
        reviews!.add(v);
      });
    }
    originalAmount = json['original_amount'];
    discountAmount = json['discount_amount'];
    finalAmount = json['final_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['method_type'] = this.methodType;
    data['payment_method'] = this.paymentMethod;
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
    data['voucher'] = this.voucher;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['original_amount'] = this.originalAmount;
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
  String? profilePicture;
  String? phoneNumber;
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
  String? productImage;
  int? quantity;
  int? price;
  int? totalPrice;

  CartItems(
      {this.id,
        this.productId,
        this.productName,
        this.productImage,
        this.quantity,
        this.price,
        this.totalPrice});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    quantity = json['quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
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
