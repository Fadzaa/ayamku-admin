import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/pos/model/pos_response.dart';
import '../../../api/pos/pos_service.dart';
import '../../../router/app_pages.dart';

class AddPosPageController extends GetxController{
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxString selectedImagePath = ''.obs;

  PosService posService = PosService();
  PosResponse posResponse = PosResponse();
  RxList<Pos> posList = <Pos>[].obs;

  RxString filePathImage = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isImageSelected = false.obs;

  //validator error
  RxString titleError = ''.obs;
  RxString descError = ''.obs;

  Future<void> pickImage(RxString imagePath) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        imagePath.value = pickedImage.path;
      }

      isImageSelected = true.obs;
  }
  
  RxString selectedKelas= "11".obs;
  RxList<String> kelasList = ["10", "11", "12"].obs;
  void onChangedKelas(String kelas) {
    selectedKelas.value = kelas;
    kelasList.remove(kelas);
    kelasList.insert(0, kelas);

  }

  // jurusan
  RxString selectedJurusan= "PPLG".obs;
  RxList<String> jurusanList = ["PPLG", "ANIM", "DKV"].obs;
  void onChangedJurusan(String jurusan) {
    selectedJurusan.value = jurusan;
    jurusanList.remove(jurusan);
    jurusanList.insert(0, jurusan);

  }

  Future<void> addPos() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      isLoading.value = true;
      
      dio.FormData formData = dio.FormData.fromMap({
        "name": titleController.text,
        "description": descriptionController.text,
        "image": await dio.MultipartFile.fromFile(filePathImage.value),
      });

      print(formData.fields);
      
      await posService.addPos(formData);

      Get.offNamedUntil(Routes.POS_PAGE, (routes) => routes.settings.name == Routes.HOME_PAGE);
      Get.snackbar("Tambah pos Sukses", "Berhasil menambahkan pos!");

    } catch (e) {
      if (e is dio.DioError) {
        print("Response data: ${e.response?.data}");
        
        Get.snackbar(
          "Error",
          e.response?.data['message'] ?? 'An error occurred',
        );
      } else {
        Get.snackbar(
          "Error",
          e.toString(),
        );
      }
      print(e);
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void onInit() {
    super.onInit();
  }

}