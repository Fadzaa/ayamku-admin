import 'package:ayamku_admin/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/pos/model/pos_response.dart';
import '../../../api/pos/pos_service.dart';



class EditPosPageController extends GetxController{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  PosResponse posResponse = PosResponse();
  PosService posService = PosService();
  final Pos pos = Get.arguments;
  final ImagePicker _picker = ImagePicker();
  RxString selectedImagePath = ''.obs;
  RxBool isLoading = false.obs;
  RxList<Pos> posList = <Pos>[].obs;



  // kelas
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

  @override
  void onInit() {
    super.onInit();
    titleController.text = pos.name!;
    descriptionController.text = pos.description!;
    selectedImagePath.value = pos.image!;
  }

  Future<void> pickImage() async {

    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
  Future<void> updatePos() async {
    try {
      isLoading(true);
      final response = await posService.updatePos(
        pos.id.toString(),
        titleController.text,
        descriptionController.text,
        selectedImagePath.value,
      );
      PosResponse productResponse = PosResponse.fromJson(response.data);
      posList.addAll(productResponse.data!);

      Get.snackbar(
        "Success",
        "Voucher updated successfully",
      );

      print("Update voucher");
      print('Updated voucher data: ${productResponse.data}');
      print(pos);

    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );

    } finally {
      isLoading.value = false;
    }
  }

  Future deletePos() async {
    try {
      await posService.deletePos(pos.id.toString(),);
    
      Get.back();
    } catch (e) {
      print(e);
    }
  } 

}