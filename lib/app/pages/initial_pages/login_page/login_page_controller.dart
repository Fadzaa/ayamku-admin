import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  @override
  void onInit() {
    super.onInit();


  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }



  void validateForm() {

  }


}