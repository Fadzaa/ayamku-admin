import 'package:ayamku_admin/app/pages/features/add_pos_page/add_pos_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/add_pos_page/add_pos_page_view.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/add_product_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/add_product_page/add_product_page_view.dart';
import 'package:ayamku_admin/app/pages/features/add_promo_page/add_promo_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/add_promo_page/add_promo_page_view.dart';
import 'package:ayamku_admin/app/pages/features/analytic_page/analytic_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/analytic_page/analytic_page_view.dart';
import 'package:ayamku_admin/app/pages/features/chat_management/chat_management_view.dart';
import 'package:ayamku_admin/app/pages/features/chat_management/chat_management_binding.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/edit_pos_page/edit_pos_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/edit_pos_page/edit_pos_page_view.dart';
import 'package:ayamku_admin/app/pages/features/edit_product_page/edit_product_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/edit_product_page/edit_product_page_view.dart';
import 'package:ayamku_admin/app/pages/features/edit_promo_page/edit_promo_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/edit_promo_page/edit_promo_page_view.dart';
import 'package:ayamku_admin/app/pages/features/edit_voucher_page/edit_voucher_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/edit_voucher_page/edit_voucher_page_view.dart';
import 'package:ayamku_admin/app/pages/features/history_page/history_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/history_page/history_page_view.dart';
import 'package:ayamku_admin/app/pages/features/home_page/home_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/home_page/home_page_view.dart';
import 'package:ayamku_admin/app/pages/features/notification_page/empty_notification_page.dart';
import 'package:ayamku_admin/app/pages/features/notification_page/notfication_binding.dart';
import 'package:ayamku_admin/app/pages/features/notification_page/notification_page_view.dart';
import 'package:ayamku_admin/app/pages/features/option_user/option_user_binding.dart';
import 'package:ayamku_admin/app/pages/features/option_user/option_user_view.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/detail_order-page/detail_order_page_view.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_view.dart';
import 'package:ayamku_admin/app/pages/features/pos_page/pos_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/pos_page/pos_page_view.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/product_page/product_page_view.dart';
import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_binding.dart';
import 'package:ayamku_admin/app/pages/features/promo-page/promo_page_view.dart';
import 'package:ayamku_admin/app/pages/initial_pages/splash_screen/splash_page_binding.dart';
import 'package:ayamku_admin/app/pages/initial_pages/splash_screen/splash_page_view.dart';
import 'package:get/get.dart';
import '../pages/features/add_voucher/add_voucher_binding.dart';
import '../pages/features/add_voucher/add_voucher_page_view.dart';
import '../pages/features/voucher_management/voucher_management_binding.dart';
import '../pages/features/voucher_management/voucher_management_page_view.dart';
import '../pages/initial_pages/login_page/login_page_binding.dart';
import '../pages/initial_pages/login_page/login_page_view.dart';

part 'app_routes.dart';

class AppPages {
  // static var routes;

  AppPages._();
  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => const SplashPageView(),
      binding: SplashPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
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
      page: () => const DetailOrderPageView(),
      binding: DetailOrderPageBinding(),
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
    GetPage(
      name: _Paths.ADD_PRODUCT_PAGE,
      page: () => const AddProductPageView(),
      binding: AddProductPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT_PAGE,
      page: () =>  EditProductPageView(),
      binding: EditProductPageBinding(),
      transition: Transition.noTransition,
     ),
   GetPage(
      name: _Paths.PROMO_PAGE,
      page: () => const PromoPageView(),
      binding: PromoPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ADD_PROMO_PAGE,
      page: () => const AddPromoPageView(),
      binding: AddPromoPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EDIT_PROMO_PAGE,
      page: () => const EditPromoPageView(),
      binding: EditPromoPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ANALYTIC_PAGE,
      page: () => const AnalyticPageView(),
      binding: AnalyticPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ANALYTIC_PAGE,
      page: () => const AnalyticPageView(),
      binding: AnalyticPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.MANAGEMENT_VOUCHER,
      page: () => const VoucherManagementPage(),
      binding: VoucherPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ADD_VOUCHER_PAGE,
      page: () => const AddVoucherPageView(),
      binding: AddVoucherPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EDIT_VOUCHER_PAGE,
      page: () => EditVoucherPageView(),
      binding: EditVoucherPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ADD_POS_PAGE,
      page: () => const AddPosPageView(),
      binding: AddPosPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EDIT_POS_PAGE,
      page: () => const EditPosPageView(),
      binding: EditPosPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.POS_PAGE,
      page: () => const PosPageView(),
      binding: PosPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.OPTION_USER,
      page: () => const OptionUserView(),
      binding: OptionUserBinding(),
      transition: Transition.noTransition,
    ),
  ];
}