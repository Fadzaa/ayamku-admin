import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPosPageController extends GetxController{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  RxString selectedImagePath = ''.obs;

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
  }


  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
    print("Image Selected");
    print(pickedFile?.path);
    print(selectedImagePath.value);
  }
}