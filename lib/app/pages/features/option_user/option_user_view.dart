import 'package:ayamku_admin/app/pages/features/option_user/option_user_controller.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/common_search.dart';
import 'package:ayamku_admin/common/loading_overlay.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'items/item_user_vertical.dart';

class OptionUserView extends GetView<OptionUserController> {
  const OptionUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Obx(() => LoadingOverlay(
        isLoading: controller.isLoading.value,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),

                Text(
                  'Pilih User',
                  style: txtHeadline1,
                ),

                SizedBox(height: 5,),

                RichText(
                  text: TextSpan(
                      text: "Pilih user yang akan di",
                      style: txtBody,
                      children: [
                        TextSpan(
                            text: "beri voucher",
                            style: txtBody.copyWith(color: primaryColor)
                        )]),
                ),

                SizedBox(height: 15,),

                CommonSearch(
                    text: "Search User",
                    controller: controller.searchController,
                    onChanged: (newText) {
                      controller.searchUser(newText);
                    }
                ),


                SizedBox(height: 50,),

                Obx(() => Expanded(
                  child: ListView.builder(
                      itemCount: controller.userListResponse.value.data?.length ?? 0,
                      itemBuilder: (context, index) => ItemUserVertical(
                        id: controller.userListResponse.value.data?[index].id ?? 0,
                        name: controller.userListResponse.value.data?[index].name ?? '',
                        image: controller.userListResponse.value.data?[index].profilePicture ?? 'https://i.imgflip.com/6yvpkj.jpg',
                      )
                  ),
                )
                )


              ],
            ),
          ),
        ),
      ),),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: CommonButton(
          text: 'Bagikan',
          onPressed: controller.giveVoucher,
        ),
      ),
    );
  }
}
