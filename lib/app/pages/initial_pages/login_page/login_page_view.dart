import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import 'login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Login \nSebagai ",
                    style: txtHeadline1,
                    children: [
                      TextSpan(
                        text: "Admin",
                        style: txtHeadline1.copyWith(
                            color: primaryColor
                        ),
                      )
                    ]
                  ),
                ),

                const SizedBox(height: 30,),

                CommonTextField(heading: "Email" , controller: controller.emailController, hintText: "Masukkan Alamat Email"),

                const SizedBox(height: 20,),

                CommonTextField(heading: "Password" , controller: controller.passwordController, hintText: "Masukkan Password", isObscure: true),

                const SizedBox(height: 60,),

                CommonButton(text: "Login", onPressed: () => controller.login(), height: 50,)

              ]
            ),
          )
      )
    );
  }
}




