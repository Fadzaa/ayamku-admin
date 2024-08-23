import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/promo/model/promo_response.dart';
import '../../../api/promo/promo_service.dart';

class PromoPageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<Promo> promosList = <Promo>[].obs;
  RxBool isLoading = false.obs;
  DateTimeRange? selectedDateRange;
  Timer? _debounce;


  PromoService promoService = PromoService();
  PromoResponse promoResponse = PromoResponse();

@override
void onInit() {
    super.onInit();

    getAllPromo();

    // searchController.addListener(() {
    //   if (_debounce?.isActive ?? false) _debounce?.cancel();
    //   _debounce = Timer(const Duration(milliseconds: 500), () {
    //     if (searchController.text.isEmpty) {
    //       getAllPromo();
    //     } else {
    //       getPromoSearch(searchController.text);
    //     }
    //   });
    // });
  }

Future <void> getAllPromo() async {
    try {
      isLoading.value = true;

      final response = await promoService.getAllPromo();

      print("Fetch Semua Product");
      print(response.data);

      promoResponse = PromoResponse.fromJson(response.data);
      promosList = promoResponse.data!.obs;

      print(promosList);


      print(promoResponse.data);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future getPromoSearch(String search) async {
    try {
      print('value search = ' + search);

      isLoading.value = true;

      final response = await promoService.getPromoSearch(search: search);
      promosList.clear();

      promosList.value = PromoResponse.fromJson(response.data).data!;

    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

}
