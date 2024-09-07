
import 'package:ayamku_admin/app/api/auth/authentication_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../router/app_pages.dart';

class LoginPageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;
  late AuthenticationService authenticationService;

  //validator error
  RxString emailError = ''.obs;
  RxString passError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    authenticationService = AuthenticationService();

  }


  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading(true);

      final fcmToken = await FirebaseMessaging.instance.getToken();

      final response = await authenticationService.login(
          emailController.text,
          passwordController.text,
          fcmToken!
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      print(response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.HOME_PAGE);

    } catch (e) {
      isLoading(true);
      if (e.toString().contains('email')) {
        emailError.value = 'Email salah';
      } else if (e.toString().contains('password')) {
        passError.value = 'Password salah';
      }
      Get.snackbar(
        "Gagal",
        "Silahkan cek email dan password anda! ",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );
      print(e);

    } finally {
      isLoading(false);
    }
  }


  void validateForm() {
    Get.toNamed(Routes.HOME_PAGE);
  }


}