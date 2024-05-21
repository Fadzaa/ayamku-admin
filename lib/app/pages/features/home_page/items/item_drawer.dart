import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    logoPrimary,
                    width: 59,
                    height: 59,
                  ),

                  SizedBox(width: 15),

                  // SwitchTutupToko()

                ],
              ),
            ),

            ListSidebar(
                text: "Chat",
                icon: icChat,
                onPressed: (){

                }
            ),
            ListSidebar(
                text: "Notifikasi",
                icon: icSidebarNotif,
                onPressed: (){

                }
            ),
            ListSidebar(
                text: "User",
                icon: icUser,
              onPressed: (){

              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListSidebar extends StatelessWidget {
  ListSidebar({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  String text;
  String icon;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: onPressed,
          child: Row(
            children: [

              SvgPicture.asset(
                icon,
                width: 26,
                height: 26,
              ),

              SizedBox(width: 15,),

              Text(
                  text,
                  style: txtFormTitle.copyWith(color: blackColor,)
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchTutupToko extends StatelessWidget {
  const SwitchTutupToko({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Text(
              "Tutup toko",
              style: txtFormTitle.copyWith(
                color: blackColor,
              ),
            ),

            const Spacer(),

           Switch(
              value: true,
              onChanged: (value) {},
            )
          ],
        ),
      ],
    );
  }
}
