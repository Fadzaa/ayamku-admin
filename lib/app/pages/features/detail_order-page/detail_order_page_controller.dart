import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailOrderPageController extends GetxController {
  var cartItems = [].obs;
  var orderId = ''.obs;
  var userName = ''.obs;
  var postName = ''.obs;
  var postDesc = ''.obs;
  var orderStatus = ''.obs;
  var methodType = ''.obs;
  var date = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      var args = Get.arguments;
      cartItems.value = args['cartItems'];
      orderId.value = args['orderId'].toString();
      userName.value = args['userName'];
      postName.value = args['postName'].toString();
      postDesc.value = args['postDesc'].toString();
      orderStatus.value = args['orderStatus'];
      methodType.value = args['methodType'];
      date.value = args['date'];
    }
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }
}