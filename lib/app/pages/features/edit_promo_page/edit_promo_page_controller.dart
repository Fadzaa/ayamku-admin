import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as dio;

import '../../../api/promo/model/promo_response.dart';
import '../../../api/promo/promo_service.dart';

class EditPromoPageControlller extends GetxController{

  final TextEditingController nameController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  // final TextEditingController descriptionController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

  RxBool isLoading = false.obs;

  final promo = Get.arguments;

  final ImagePicker _picker = ImagePicker();
  RxString selectedImagePath = ''.obs;
  
  PromoService promoService = PromoService();
  PromoResponse promoResponse = PromoResponse();

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImagePath.value = pickedFile.path;
    }
    print("Image Selected");
    print(pickedFile?.path);
    print(selectedImagePath.value);
  }

  void selectDate (BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd MMMM yyyy').format(picked);
      controller.text = formattedDate;
    }

    print(picked);
  }

  @override
  void onInit() {
    super.onInit();

    DateFormat format = DateFormat("dd MMMM yyyy");
    DateTime startDate = format.parse(promo['startDate']);
    DateTime endDate = format.parse(promo['endDate']);

    // Format the dates
    String formattedStartDate = DateFormat('yyyy-MM-dd').format(startDate);
    String formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);

    // Set the text of the controllers


    nameController.text = promo['name'];
    discountController.text = promo['discount'].toString();
    eventController.text = promo['event'];
    startDateController.text = formattedStartDate;
    endDateController.text = formattedEndDate;
    selectedImagePath.value = promo['image'];

    print("Check type selectedImagePath.value");
    print(selectedImagePath.value.contains("https"));

  }

  Future <void> updatePromo() async {
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
        Get.snackbar("Error", "End date must be after start date");
      }

      Map<String, dynamic> data = {
        "name" : nameController.text,
        "description" : eventController.text,
        "discount" : int.parse(discountController.text),
        "start_date" : startDate.toString(),
        "end_date" : endDate.toString(),
      };

      if (!selectedImagePath.value.contains("https")) {
        data["image"] = await dio.MultipartFile.fromFile(selectedImagePath.value);
      }

      dio.FormData formData = dio.FormData.fromMap(data);

      await promoService.updatePromo(formData, promo['id']);

      Get.snackbar("Update promo berhasil", "Berhasil memperbarui promo!");

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

  Future<void> deletePromo() async {
    try {
      isLoading(true);
      
      await promoService.deletePromo(promo['id']);

      Get.snackbar(
        "Success",
        "Promo deleted successfully",
      );

      Get.offNamedUntil(Routes.PROMO_PAGE, (routes) => routes.settings.name == Routes.HOME_PAGE);

    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );

    } finally {
      isLoading.value = false;
    }
  }

}