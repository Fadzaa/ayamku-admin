import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../router/app_pages.dart';


class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkSharedPreferences();
  }


  void checkSharedPreferences() async {
    await Future.delayed(Duration(seconds: 1));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    print("CHECK CURRENT SHARED PREFERENCES TOKEN");
    print(token);

    if (token != null) {
      Get.offAllNamed(Routes.HOME_PAGE);
    } else {
      Get.offNamed(Routes.LOGIN_PAGE);
    }
  }

}