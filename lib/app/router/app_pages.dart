import 'package:ayamku_admin/app/pages/features/chat_management/chat_management_view.dart';
import 'package:ayamku_admin/app/pages/features/chat_management/chat_management_binding.dart';
import 'package:ayamku_admin/app/pages/features/history_page/history_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/history_page/history_page_view.dart';
import 'package:ayamku_admin/app/pages/features/home_page/home_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/home_page/home_page_view.dart';
import 'package:ayamku_admin/app/pages/features/notification_page/empty_notification_page.dart';
import 'package:ayamku_admin/app/pages/features/notification_page/notfication_binding.dart';
import 'package:ayamku_admin/app/pages/features/notification_page/notification_page_view.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_detail_view.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_view.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_view.dart';

import 'package:get/get.dart';
import '../pages/initial_pages/login_page/login_page_binding.dart';
import '../pages/initial_pages/login_page/login_page_view.dart';

part 'app_routes.dart';

class AppPages {
  // static var routes;

  AppPages._();

  static const INITIAL = Routes.PRODUCT_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
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
    GetPage(
      name: _Paths.ORDER_PAGE,
      page: () => const OrderPageView(),
      binding: OrderPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.HISTORY_PAGE,
      page: () => const HistoryPageView(),
      binding: HistoryPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DETAIL_ORDER_PAGE,
      page: () => const OrderPageDetailView(),
      binding: OrderPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EMPTY_NOTIFICATION,
      page: () => const EmptyNotificationPageView(),
      binding: HistoryPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.NOTIF_MANAGEMENT,
      page: () => const NotificationPageView(),
      binding: NotificationPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHAT_MANAGEMENT,
      page: () => const ChatManagementPageView(),
      binding: ChatManagementBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE,
      page: () => const ProductPageView(),
      binding: ProductPageBinding(),
      transition: Transition.noTransition,
    ),
  ];
}