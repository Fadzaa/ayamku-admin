import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/theme.dart';
import '../../../../common/constant.dart';
import '../../global_component/common_search.dart';

class ChatManagementPageView extends StatelessWidget {
  const ChatManagementPageView({super.key});

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
              "Chat ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
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
              CommonSearch(text: "Search"),
              SizedBox(height: 20),
              ListTile(
                  leading: Image(
                    image: AssetImage(icPerson),
                    width: 50,
                    height: 50,
                  ),
                  title: const Text(
                    "AlyaaRana",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                      "That sounds great! . I’m in."),
                  trailing: Column(
                    children: [
                      Text("11.20 Am"),
                      SizedBox(height: 5),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primaryColor80,
                        ),
                        child: Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        )
                      ),
                    ],
                    ),
                ),
              Divider(
                color: blackColor80,
              ),
              ListTile(
                  leading: Image(
                    image: AssetImage(icPerson),
                    width: 50,
                    height: 50,
                  ),
                  title: const Text(
                    "AlyaaRana",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                      "That sounds great! . I’m in."),
                  trailing: Column(
                    children: [
                      Text("11.20 Am"),
                      SizedBox(height: 5),
                      Icon(
                        Icons.check,
                        color: primaryColor,
                      )
                    ],
                    ),
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