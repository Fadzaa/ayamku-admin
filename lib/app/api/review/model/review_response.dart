class ReviewResponse {
  int? ratingAvg;
  int? ratingCount;
  int? i5Stars;
  int? i4Stars;
  int? i3Stars;
  int? i2Stars;
  int? i1Stars;
  List<ListCustomerReviews>? listCustomerReviews;

  ReviewResponse(
      {this.ratingAvg,
        this.ratingCount,
        this.i5Stars,
        this.i4Stars,
        this.i3Stars,
        this.i2Stars,
        this.i1Stars,
        this.listCustomerReviews});

  ReviewResponse.fromJson(Map<String, dynamic> json) {
    ratingAvg = json['rating_avg'];
    ratingCount = json['rating_count'];
    i5Stars = json['5_stars'];
    i4Stars = json['4_stars'];
    i3Stars = json['3_stars'];
    i2Stars = json['2_stars'];
    i1Stars = json['1_stars'];
    if (json['list_customer_reviews'] != null) {
      listCustomerReviews = <ListCustomerReviews>[];
      json['list_customer_reviews'].forEach((v) {
        listCustomerReviews!.add(new ListCustomerReviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_avg'] = this.ratingAvg;
    data['rating_count'] = this.ratingCount;
    data['5_stars'] = this.i5Stars;
    data['4_stars'] = this.i4Stars;
    data['3_stars'] = this.i3Stars;
    data['2_stars'] = this.i2Stars;
    data['1_stars'] = this.i1Stars;
    if (this.listCustomerReviews != null) {
      data['list_customer_reviews'] =
          this.listCustomerReviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCustomerReviews {
  int? id;
  String? userName;
  String? productName;
  int? orderId;
  int? rating;
  String? comment;
  String? createdAt;

  ListCustomerReviews(
      {this.id,
        this.userName,
        this.productName,
        this.orderId,
        this.rating,
        this.comment,
        this.createdAt});

  ListCustomerReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    productName = json['product_name'];
    orderId = json['order_id'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['product_name'] = this.productName;
    data['order_id'] = this.orderId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    return data;
  }
}
