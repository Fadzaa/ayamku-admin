import 'package:ayamku_admin/app/pages/features/home_page/home_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/home_page/home_page_view.dart';
import 'package:get/get.dart';
import '../pages/initial_pages/login_page/login_page_binding.dart';
import '../pages/initial_pages/login_page/login_page_view.dart';

part 'app_routes.dart';

class AppPages {
  // static var routes;

  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
      transition: Transition.noTransition,
    ),


  ];
}