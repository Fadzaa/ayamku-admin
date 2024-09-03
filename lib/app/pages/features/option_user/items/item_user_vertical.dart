import 'package:ayamku_admin/app/pages/features/option_user/option_user_controller.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemUserVertical extends GetView<OptionUserController> {
  const ItemUserVertical({
    super.key,
    required this.name,
    required this.image,
    required this.id
  });

  final String name, image;
  final int id;

  @override
  Widget build(BuildContext context) {
    RxBool isActive = false.obs;

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(width: 10),
          Text(name),

          const Spacer(),

          Obx(() => Checkbox(
              checkColor: blackColor,
              activeColor: primaryColor,
              value: isActive.value,
              onChanged: (value) {
                isActive.value = value!;

                if(isActive.value){
                  controller.listUserId.add(id);
                  print(controller.listUserId);
                } else {
                  controller.listUserId.remove(id);
                  print(controller.listUserId);
                }
              }
          ))
        ]
      ),
    );
  }
}
