import 'dart:io';

import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../api/promo/model/promo_response.dart';
import '../../../api/promo/promo_service.dart';
import '../../../router/app_pages.dart';


class AddPromoPageController extends GetxController{

  final PromoPageController promoPageController = Get.find();

  String startDateFormatted = '';
  String endDateFormatted = '';


  final TextEditingController nameController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  // final TextEditingController descriptionController = TextEditingController();
  final TextEditingController discountController = TextEditingController();


  final ImagePicker _picker = ImagePicker();

  RxString selectedImagePath = ''.obs;
  RxString filePathImage = ''.obs;
  RxBool isLoading = false.obs;
  PromoService promoService = PromoService();
  PromoResponse promoResponse = PromoResponse();
  RxList<Promo> promosList = <Promo>[].obs;


  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

   if (pickedFile != null) {
    selectedImagePath.value = pickedFile.path;
    filePathImage.value = pickedFile.path;
  }
    print("Image Selected");
    print(pickedFile?.path);
    print(selectedImagePath.value);
  }

  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      controller.text = formattedDate;
    }

    print(picked);
}



  Future<void> addPromo() async {
    try {
      isLoading.value = true;

      DateTime? startDate;
      DateTime? endDate;
      try {
        startDate = DateTime.parse(startDateController.text);
        endDate = DateTime.parse(endDateController.text);
      } catch (e) {
        throw FormatException("Invalid date format. Please use YYYY-MM-DD format.");
      }

      if (endDate.isBefore(startDate)) {
        throw Exception("End date must be after start date");
      }



      dio.FormData formData = dio.FormData.fromMap({
        "name" : nameController.text,
        "description" : eventController.text,
        "discount" : int.parse(discountController.text),
        "start_date" : startDate.toString(),
        "end_date" : endDate.toString(),
        'image': await dio.MultipartFile.fromFile(filePathImage.value),
      });

      await promoService.addPromo(formData);

      Get.snackbar("Tambah voucher Sukses", "Berhasil menambahkan voucher!");

      Get.offNamedUntil(Routes.PROMO_PAGE, (routes) => routes.settings.name == Routes.HOME_PAGE);

    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
  void clearForm() {
    nameController.clear();
    eventController.clear();
  }

  @override
  void onClose() {
    nameController.clear();
    eventController.clear();
    super.onClose();
  }

  void onInit() {
    super.onInit();
  }

}