import 'package:ayamku_admin/app/pages/features/add_pos_page/add_pos_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/add_pos_page/item/item_select_dropdown.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_pick_img.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/items/item_text_field.dart';
import 'package:ayamku_admin/common/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPosPageSection extends GetView<AddPosPageController> {
  const AddPosPageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Obx(() => LoadingOverlay(
              isLoading: controller.isLoading.value,
              body: Form(
                key: controller.formKey,
                child: Column(
                  children: [


                    Obx(() => PickImg(
                      onTap: () => controller.pickImage(controller.filePathImage),
                      imagePath: controller.filePathImage.value,
                      isImageSelected: controller.isImageSelected,
                    ),),

                    SizedBox(height: 20),

                    ItemTextField(
                      text: "Nama",
                      hintText: "Masukkan nama",
                      controller: controller.titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          controller.titleError.value =
                          'Harap masukkan nama pos.';
                          return controller.titleError.value;
                        }
                        controller.titleError.value = '';
                        return null;
                      },
                    ),

                    // SizedBox(height: 20),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ItemSelectDropdown(
                    //         titleTxt: 'Pilih Kelas',
                    //         hintTxt: 'Pilih kelas',
                    //         dropdownList: ["10", "11", "12"],
                    //         selectedValue: controller.selectedKelas.value,
                    //         onChanged: (value) => controller.onChangedKelas(value!),
                    //       ),
                    //     ),
                    //
                    //     SizedBox(width: 20),
                    //
                    //     Expanded(
                    //       child: ItemSelectDropdown(
                    //         titleTxt: 'Pilih Jurusan',
                    //         hintTxt: 'Pilih jurusan',
                    //         dropdownList: ["PPLG", "ANIM", "DKV"],
                    //         selectedValue: controller.selectedJurusan.value,
                    //         onChanged: (value) => controller.onChangedJurusan(value!),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    SizedBox(height: 20),

                    ItemTextField(
                      text: "Deskripsi",
                      hintText: "Ini adalah pos yang berada di gazebo",
                      minLines: 5,
                      maxLines: 6,
                      controller: controller.descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          controller.descError.value =
                          'Harap masukkan deskripsi pos.';
                          return controller.descError.value;
                        }
                        controller.descError.value = '';
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
