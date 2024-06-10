import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_pick_img.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/app/pages/features/edit_pos_page/edit_pos_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../add_pos_page/item/item_select_dropdown.dart';

class EditPosPageSection extends GetView<EditPosPageController> {
  const EditPosPageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            PickImg(
              onTap: controller.pickImage,
              imagePath: controller.selectedImagePath.value,
            ),

            SizedBox(height: 20),

            ItemTextField(
              text: "Nama",
              hintText: "Masukkan nama",
              controller: controller.titleController,
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ItemSelectDropdown(
                    titleTxt: 'Pilih Kelas',
                    hintTxt: 'Pilih kelas',
                    dropdownList: ["10", "11", "12"],
                    selectedValue: controller.selectedKelas.value,
                    onChanged: (value) => controller.onChangedKelas(value!),
                  ),
                ),

                SizedBox(width: 20),

                Expanded(
                  child: ItemSelectDropdown(
                    titleTxt: 'Pilih Jurusan',
                    hintTxt: 'Pilih jurusan',
                    dropdownList: ["PPLG", "ANIM", "DKV"],
                    selectedValue: controller.selectedJurusan.value,
                    onChanged: (value) => controller.onChangedJurusan(value!),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            ItemTextField(
              text: "Deskripsi",
              hintText:"Ini adalah pos yang berada di gazebo",
              minLines: 5,
              maxLines: 6,
              controller: controller.titleController,
            ),
          ],
        ),


      ),
    );
  }
}
