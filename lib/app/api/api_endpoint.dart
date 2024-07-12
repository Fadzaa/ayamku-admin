class ApiEndPoint {
  static String baseUrl = 'https://ayamku-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';

  //Store
  static String store = '$baseUrl/store-status';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth';
  static String logout = '$baseUrlAuth/logout';

  //Product
  static String product = '$baseUrl/products';
  static String promo = '$baseUrl/promos';


  //Voucher
   static String voucher = '$baseUrl/vouchers';
   static String updateVoucher (String id) => '$baseUrl/vouchers/$id';

   //Order
   static String order = '$baseUrl/orders';


}