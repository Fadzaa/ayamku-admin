import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/theme.dart';
import '../../../../common/constant.dart';

class NotificationPageView extends StatelessWidget {
  const NotificationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        
        title: Row(
          children: [
            SvgPicture.asset(
              icBack, 
              width: 15, 
              height: 15, 
            ),
            SizedBox(width: 10),
            Text(
              "Notifikasi ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
            Spacer(),
            Text(
              "mark all as read",
              style: txtTitlePage.copyWith(
                fontSize: 14,
                color: primaryColor,
              )
            ),
          ],
        )
      ),
      backgroundColor: baseColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                "Terbaru",
                style: txtTitlePage.copyWith(
                  fontSize: 15,
                  color: blackColor,
                ),
              ),
              
              ListTile(
                  leading: Image(
                    image: AssetImage(icWarning),
                    width: 50,
                    height: 50,
                  ),
                  title: const Text(
                    "Pesanan AlyaaRana tidak ditemukan",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                      "5 menit yang lalu"),
                ),
              Divider(
                color: blackColor80,
              ),
              ListTile(
                  leading: Image(
                    image: AssetImage(icSpoon),
                    width: 50,
                    height: 50,
                  ),
                  title: const Text(
                    "Lorem ipsum de sit alert",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                      "5 menit yang lalu"),
                ),
              Divider(
                color: blackColor80,
              ),
              ListTile(
                  leading: Image(
                    image: AssetImage(icLocation),
                    width: 50,
                    height: 50,
                  ),
                  title: const Text(
                    "Lorem ipsum de sit alert",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                      "5 menit yang lalu"),
                ),
                Divider(
                color: blackColor80,
              ),
              ],
            )
            )
          ),
        ),
    );
  }
}