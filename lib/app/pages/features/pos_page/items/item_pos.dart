import 'package:ayamku_admin/app/pages/features/pos_page/model/pos_data.dart';
import 'package:ayamku_admin/app/pages/features/pos_page/pos_page_controller.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemPos extends GetView<PosPageController>{
  const ItemPos ({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: pos_data.length,
      itemBuilder: (context, index) {
        final pos = pos_data[index];

        return InkWell(
          onTap: (){
            Get.toNamed(Routes.EDIT_POS_PAGE);
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
                        child: Image.asset(
                          pos.img,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        pos.name,
                        style: txtListItemTitle.copyWith(color: blackColor),
                      ),

                      SizedBox(height: 5,),

                      Container(
                        width: screenWidth,
                        child: Text(
                          pos.desc,
                          style: txtBody.copyWith(color: blackColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}