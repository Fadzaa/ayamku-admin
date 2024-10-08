class ApiEndPoint {
  static String baseUrl = 'https://ayamku-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';

  //Store
  static String store = '$baseUrl/store-status';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth';
  static String logout = '$baseUrlAuth/logout';
  static String allUser = '$baseUrlAuth/all-user';

  //Product
  static String product = '$baseUrl/products';

  //promo
  static String updatePromo (String id) => '$baseUrl/promos/$id';
  static String promo = '$baseUrl/promos';

  //Voucher
   static String voucher = '$baseUrl/vouchers';
   static String giveVoucher = '$baseUrl/vouchers/give';
   static String voucherExpired = '$baseUrl/vouchers/expired';
   static String giveVoucherMass = '$baseUrl/vouchers/give-mass';
   static String updateVoucher (String id) => '$baseUrl/vouchers/$id';

   //pos
   static String pos = '$baseUrl/posts';
   static String updatePos (String id) => '$baseUrl/posts/$id';

   //Order
   static String order = '$baseUrl/orders';
  static String orderLatest = '$baseUrl/orders/latest';
   static String orderHistories = '$baseUrl/order-histories';
   static String orderStatus = '$baseUrl/orders/update-status';


  //Sales summary
   static String salesSummary = '$baseUrl/sales-summary';

   //Review
  static String getAllReview = '$baseUrl/reviews';
  static String getReviewProductId(int productId) => '$baseUrl/reviews/$productId';

  //analytic
   static String analytic = '$baseUrl/analytic-revenue';



}