import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../router/app_pages.dart';


class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkFirstTime();
  }


  void checkFirstTime() async {

    await Future.delayed(const Duration(seconds: 1));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirst') ?? true;

    if (isFirstLaunch) {
      Get.offNamed(Routes.LOGIN_PAGE);
      await prefs.setBool('isFirst', false);
    } else {
      final token = prefs.getString('token');
      if (token != null) {
        Get.offAllNamed(Routes.HOME_PAGE);
      } else {
        Get.offAllNamed(Routes.LOGIN_PAGE);
      }
    }
  }

}