import 'package:ayamku_admin/app/pages/features/promo-page/model/promo.dart';
import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class AddPromoPageController extends GetxController{

  final PromoPageController promoPageController = Get.find<PromoPageController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();


  RxString selectedImagePath = ''.obs;

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
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
      String formattedDate = DateFormat('dd MMMM yyyy').format(picked);
      controller.text = formattedDate;
    }

    print(picked);
  }

  void addProduct() {
    promoPageController.addPromo(Promo(
      name: nameController.text,
      image: imageController.text,
      event: eventController.text,
      startDate: DateTime.parse(startDateController.text),
      endDate: DateTime.parse(endDateController.text),
    ));
    clearForm();
    Get.back();
  }


  void clearForm() {
    nameController.clear();
    eventController.clear();
    startDateController.clear();
    endDateController.clear();
    imageController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    endDateController.dispose();
    eventController.dispose();
    startDateController.dispose();
    imageController.dispose();
    super.onClose();
  }

}