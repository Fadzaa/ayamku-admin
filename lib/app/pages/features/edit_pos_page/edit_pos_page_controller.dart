import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/pos/model/pos_response.dart';
import '../../../api/pos/pos_service.dart';

class EditPosPageController extends GetxController {

  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  PosResponse posResponse = PosResponse();
  PosService posService = PosService();
  final pos = Get.arguments;
  final ImagePicker _picker = ImagePicker();
  RxString selectedImagePath = ''.obs;
  RxBool isLoading = false.obs;
  RxList<Pos> posList = <Pos>[].obs;

  //validator error
  RxBool isImageSelected = false.obs;
  RxString titleError = ''.obs;
  RxString descError = ''.obs;

  // kelas
  RxString selectedKelas = "11".obs;
  RxList<String> kelasList = ["10", "11", "12"].obs;
  void onChangedKelas(String kelas) {
    selectedKelas.value = kelas;
    kelasList.remove(kelas);
    kelasList.insert(0, kelas);
  }

  // jurusan
  RxString selectedJurusan = "PPLG".obs;
  RxList<String> jurusanList = ["PPLG", "ANIM", "DKV"].obs;
  void onChangedJurusan(String jurusan) {
    selectedJurusan.value = jurusan;
    jurusanList.remove(jurusan);
    jurusanList.insert(0, jurusan);
  }

  @override
  void onInit() {
    super.onInit();
    print("test run program");

    titleController.text = pos['name'];
    descriptionController.text = pos["description"];
    selectedImagePath.value = pos["image"];
  }

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
    isImageSelected.value = true;
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  Future<void> updatePos() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading(true);

      Map<String, dynamic> data = {
        "name": titleController.text,
        "description": descriptionController.text,
      };

      if (!selectedImagePath.value.contains("https")) {
        data["image"] =
            await dio.MultipartFile.fromFile(selectedImagePath.value);
      }

      dio.FormData formData = dio.FormData.fromMap(data);

      await posService.updatePos(formData, pos['id'].toString());

      Get.snackbar(
        "Success",
        "POS updated successfully",
      );

      Get.snackbar("Perbarui post sukses", "Berhasil memperbarui pos!");

      Get.offNamedUntil(Routes.POS_PAGE,
          (routes) => routes.settings.name == Routes.HOME_PAGE);
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );

      print("CHECK ERROR");
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future deletePos() async {
    try {
      await posService.deletePos(pos['id'].toString());

      Get.snackbar(
        "Success",
        "Pos deleted successfully",
      );

      Get.offNamedUntil(Routes.POS_PAGE,
          (routes) => routes.settings.name == Routes.HOME_PAGE);
    } catch (e) {
      print(e);
    }
  }
}
