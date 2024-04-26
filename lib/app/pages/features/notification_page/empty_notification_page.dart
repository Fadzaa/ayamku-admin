import 'package:flutter/material.dart';
import '../../../../common/theme.dart';
import '../../../../common/constant.dart';

class EmptyNotificationPageView extends StatelessWidget {
  const EmptyNotificationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            // Tambahkan aksi ketika tombol arrow left diklik
         },
      ),
        title: Row(
          children: [
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
        child: Center(
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage(imgEmptyNotif),
                width: 200,
                height: 200,
                alignment: Alignment.center,
                ),
              SizedBox(height: 10,),
              Text(
                "Kamu belum memiliki notifikasi apapun",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ),
        ),
        
        ),
    );
  }
}