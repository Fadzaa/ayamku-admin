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

  //promo
   static String updatePromo (String id) => '$baseUrl/promo/$id';
   static String promo = '$baseUrl/promos';


  //Voucher
   static String voucher = '$baseUrl/vouchers';
   static String updateVoucher (String id) => '$baseUrl/vouchers/$id';

   

   //pos
   static String pos = '$baseUrl/posts';
   static String updatePos (String id) => '$baseUrl/pos/$id';


   //Order
   static String order = '$baseUrl/orders';


}