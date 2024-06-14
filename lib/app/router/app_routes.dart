part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_PAGE = _Paths.SPLASH_PAGE;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const LOGIN_PAGE = _Paths.LOGIN_PAGE;
  static const ORDER_PAGE = _Paths.ORDER_PAGE;
  static const DETAIL_ORDER_PAGE = _Paths.DETAIL_ORDER_PAGE;
  static const HISTORY_PAGE = _Paths.HISTORY_PAGE;
  static const EMPTY_NOTIFICATION = _Paths.EMPTY_NOTIFICATION;
  static const NOTIF_MANAGEMENT = _Paths.NOTIF_MANAGEMENT;
  static const CHAT_MANAGEMENT = _Paths.CHAT_MANAGEMENT;
  static const PRODUCT_PAGE = _Paths.PRODUCT_PAGE;
  static const ADD_PRODUCT_PAGE = _Paths.ADD_PRODUCT_PAGE;
  static const EDIT_PRODUCT_PAGE = _Paths.EDIT_PRODUCT_PAGE;
  static const PROMO_PAGE = _Paths.PROMO_PAGE;
  static const ADD_PROMO_PAGE = _Paths.ADD_PROMO_PAGE;
  static const EDIT_PROMO_PAGE = _Paths.EDIT_PROMO_PAGE;
  static const ANALYTIC_PAGE = _Paths.ANALYTIC_PAGE;
  static const MANAGEMENT_VOUCHER = _Paths.MANAGEMENT_VOUCHER;
  static const ADD_VOUCHER_PAGE = _Paths.ADD_VOUCHER_PAGE;
  static const ADD_POS_PAGE = _Paths.ADD_POS_PAGE;
  static const POS_PAGE = _Paths.POS_PAGE;
  static const EDIT_POS_PAGE = _Paths.EDIT_POS_PAGE;
  static const OPTION_USER = _Paths.OPTION_USER;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_PAGE = '/';
  static const HOME_PAGE = '/home-page';
  static const LOGIN_PAGE = '/login-page';
  static const ORDER_PAGE = '/order-page';
  static const HISTORY_PAGE = '/history-page';
  static const DETAIL_ORDER_PAGE = '/detail-order-page';
  static const EMPTY_NOTIFICATION = '/empty-notification';
  static const NOTIF_MANAGEMENT = '/notif-management';
  static const CHAT_MANAGEMENT = '/chat-management';
  static const PRODUCT_PAGE = '/product-page';
  static const ADD_PRODUCT_PAGE = '/add-product-page';
  static const EDIT_PRODUCT_PAGE = '/edit-product-page';
  static const PROMO_PAGE = '/promo-page';
  static const ADD_PROMO_PAGE = '/add-promo-page';
  static const EDIT_PROMO_PAGE = '/edit-promo-page';
  static const ANALYTIC_PAGE = '/analytic-page';
  static const MANAGEMENT_VOUCHER = '/management-voucher';
  static const ADD_VOUCHER_PAGE = '/add-voucher-page';
  static const ADD_POS_PAGE = '/add-pos-page';
  static const POS_PAGE = '/pos-page';
  static const EDIT_POS_PAGE = '/edit-pos-page';
  static const OPTION_USER = '/option-user-page';
}