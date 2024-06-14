class ApiEndPoint {
  static String baseUrl = 'http://ayamku-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';

  //Store
  static String store = '$baseUrl/store-status';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth';
  static String logout = '$baseUrlAuth/logout';

  //Product
  static String product = '$baseUrl/products';

  //Voucher
   static String voucher = '$baseUrl/vouchers';


}