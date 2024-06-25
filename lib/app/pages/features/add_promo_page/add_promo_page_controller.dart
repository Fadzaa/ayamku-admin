import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../api/promo/model/promo_response.dart';
import '../../../api/promo/promo_service.dart';


class AddPromoPageController extends GetxController{

  final PromoPageController promoPageController = Get.put(PromoPageController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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

  Future<void> addPromo() async {
    try {
      isLoading.value = true;
      dio.FormData formData = dio.FormData.fromMap({
        "name" : nameController.text,
        "description" : descriptionController.text,
        "start_date" : startDateController.text,
        "end_date" : endDateController.text,
        'image': await dio.MultipartFile.fromFile(filePathImage.value),
      });

      await promoService.addPromo(
          formData
      );

      Promo promo = Promo(
          name: nameController.text,
          description: descriptionController.text,
          startDate: startDateController.text,
          endDate: endDateController.text,
          image: filePathImage.value
      );

      promoPageController.promosList.add(promo);

      update();

    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

}