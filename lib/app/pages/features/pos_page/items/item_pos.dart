import 'package:ayamku_admin/app/pages/features/pos_page/pos_page_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemPos extends GetView<PosPageController> {
  const ItemPos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() => controller.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: controller.listPos.length,
            itemBuilder: (context, index) {
              final pos = controller.listPos[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.EDIT_POS_PAGE,
                    arguments: {
                      'id': pos.id,
                      'image': pos.image,
                      'name': pos.name,
                      'description': pos.description,
                    }
                    );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                pos.image.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pos.name.toString(),
                              style: txtListItemTitle.copyWith(color: blackColor),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: screenWidth,
                              child: Text(
                                pos.description.toString(),
                                style: txtBody.copyWith(color: blackColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ));
  }
}