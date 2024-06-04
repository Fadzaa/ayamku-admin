
import 'package:ayamku_admin/app/api/auth/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../router/app_pages.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;
  late AuthenticationService authenticationService;
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
    try {
      isLoading(true);
      final response = await authenticationService.login(
          emailController.text,
          passwordController.text
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      print(response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.HOME_PAGE);

    } catch (e) {
      isLoading(true);
      Get.snackbar("Login Error", "Invalid email or password");
      print(e);

    } finally {
      isLoading(false);
    }
  }


  void validateForm() {
    Get.toNamed(Routes.HOME_PAGE);
  }


}