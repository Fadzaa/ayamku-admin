
import 'package:ayamku_admin/app/pages/features/promo-page/model/promo.dart';
import 'package:ayamku_admin/app/pages/features/promo-page/model/promo_data.dart';
import 'package:get/get.dart';

class PromoPageController extends GetxController {
  RxList<Promo> promosList = promo_data;


  void addPromo(Promo promo) {
    promosList.add(promo);
  }

  void updatePromo(int index, Promo promo) {
    promosList[index] = promo;
  }

  void deletePromo(int index) {
    promosList.removeAt(index);
  }
}

