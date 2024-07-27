import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../api/promo/model/promo_response.dart';
import '../../../api/promo/promo_service.dart';

class EditPromoPageControlller extends GetxController{
  final PromoPageController promoPageController = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  late int promoIndex;

  RxBool isLoading = false.obs;

  final Promo promo = Get.arguments;
  RxList<Promo> promoList = <Promo>[].obs;

  RxString imagePath = RxString("");
  RxString selectedImagePath = ''.obs;

  
  PromoService promoService = PromoService();
  PromoResponse promoResponse = PromoResponse();

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
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
    nameController.text = promo.name!;
    discountController.text = promo.discount.toString();
    descriptionController.text = promo.description!;
    startDateController.text = promo.startDate!;
    endDateController.text = promo.endDate!;
  }

  Future <void> updatePromo() async {
    try {
      isLoading(true);
      final response = await promoService.updatePromo(
          promo.id.toString(),
          nameController.text,
          descriptionController.text,
          discountController.text,
          startDateController.text,
          endDateController.text,
          imageController.text,
        );
      PromoResponse voucherResponse = PromoResponse.fromJson(response.data);
      promoList.addAll(voucherResponse.data!);

      Get.snackbar(
        "Success",
        "Voucher updated successfully",
      );

      print("Update voucher");
      print('Updated voucher data: ${voucherResponse.data}');
      print(promo);


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