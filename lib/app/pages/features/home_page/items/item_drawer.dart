import 'package:ayamku_admin/app/pages/features/home_page/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: baseColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 70,),

            Image.asset(
              logoPrimary,
              width: 60,
              height: 60,
            ),

            SizedBox(height: 20,),

            SizedBox(
              height: 45,
              child: const Expanded(child: SwitchTutupToko()),),

            SizedBox(height: 20,),

            ListSidebar(
              text: "Chat",
              icon: icChat,
              onPressed: () {},
            ),

            SizedBox(height: 20,),

            ListSidebar(
              text: "Notifikasi",
              icon: icSidebarNotif,
              onPressed: () {},
            ),

            // ListSidebar(
            //   text: "User",
            //   icon: icUser,
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}

class ListSidebar extends StatelessWidget {
  const ListSidebar({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  final String text;
  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [

          SvgPicture.asset(
            icon,
            width: 26,
            height: 26,
          ),

          SizedBox(width: 15),

          Text(
            text,
            style: txtFormTitle.copyWith(color: blackColor),
          ),
        ],
      ),
    );
  }
}


class SwitchTutupToko extends StatelessWidget {
  const SwitchTutupToko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text(
          "Tutup toko",
          style: txtFormTitle.copyWith(color: blackColor),
        ),

        const Spacer(),

        Obx(() => FlutterSwitch(
          width: 45.0,
          height: 25.0,
          toggleSize: 21.0,
          value: controller.isActive.value,
          borderRadius: 12.5,
          padding: 3.5,
          activeColor: primaryColor,
          inactiveColor: Color(0xFFE7E7E8),
          activeToggleColor: Colors.white,
          inactiveToggleColor: Colors.white,
          onToggle: (value) {
            controller.toggleSwitch(value);
          },
        )),
      ],
    );
  }
}