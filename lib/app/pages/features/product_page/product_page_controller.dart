import 'dart:async';

import 'package:ayamku_admin/app/api/product/model/product_response.dart';
import 'package:ayamku_admin/app/api/product/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductPageController extends GetxController{
  TextEditingController searchController = TextEditingController();

  RxString selectedValue = 'All'.obs;
  RxString dropdownValue = "Today".obs;

  var arguments = Get.arguments;

  RxBool isLoading = false.obs;

  Timer? _debounce;

  RxString filePathImage = ''.obs;

  RxList<Product> listProduct = <Product>[].obs;
  ProductService productService = ProductService();
  ProductResponse productResponse = ProductResponse();


@override
  void onInit() {
    super.onInit();

    getAllProduct();

    searchController.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        if (searchController.text.isEmpty) {
          getAllProduct();
        } else {
          getProductSearch(searchController.text);
        }
      });
    });
  }

  void onChangeValue(String selectDay, List<String> items) {
    dropdownValue.value = selectDay;
    items.remove(selectDay);
    items.insert(0, selectDay);
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }

  void getAllProduct() async {
    try {
      isLoading.value = true;

      final response = await productService.getAllProduct();

      print("Fetch Semua Product");
      print(response.data);

      productResponse = ProductResponse.fromJson(response.data);
      listProduct = productResponse.data!.obs;

      print(listProduct);


      print(productResponse.data);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future getProductSearch(String search) async {
    try {
      print('value search = ' + search);

      isLoading.value = true;

      final response = await productService.getProductSearch(search: search);
      listProduct.clear();
      listProduct.addAll(ProductResponse.fromJson(response.data).data!);

    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future getProductCategory(String category) async {
    try {
      print('value category = ' + category);
      isLoading.value = true;

      final response = await productService.getProductCategory(category: category);
      listProduct.clear();

      print("CHECK RESPONSE CATEGORY");
      print(response.data);
      listProduct.addAll(ProductResponse.fromJson(response.data).data!);


    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

}
