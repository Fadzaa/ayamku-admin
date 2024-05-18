import 'package:ayamku_admin/app/pages/features/promo-page/model/promo.dart';
import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditPromoPageControlller extends GetxController{
  final PromoPageController promoPageController = Get.find<PromoPageController>();
  late int promoIndex;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  RxString imagePath = RxString("");
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

  void updateProduct() {
    promoPageController.updatePromo(promoIndex, Promo(
      name: nameController.text,
      image: selectedImagePath.value,
      event: eventController.text,
      startDate: DateFormat('dd MMMM yyyy').parse(startDateController.text),
      endDate: DateFormat('dd MMMM yyyy').parse(endDateController.text),
    ));
    Get.back();
  }



  @override
  void onClose() {
    nameController.dispose();
    endDateController.dispose();
    eventController.dispose();
    startDateController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    promoIndex = args['index'] as int;
    final promo = promoPageController.promosList[promoIndex];
    nameController.text = promo.name;
    selectedImagePath.value = promo.image;
    startDateController.text = DateFormat('dd MMMM yyyy').format(args['startDate'] as DateTime);
    endDateController.text = DateFormat('dd MMMM yyyy').format(args['endDate'] as DateTime);
  }

}