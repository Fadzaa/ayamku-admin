part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_PAGE = _Paths.SPLASH_PAGE;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const LOGIN_PAGE = _Paths.LOGIN_PAGE;
  static const ORDER_PAGE = _Paths.ORDER_PAGE;
  static const DETAIL_ORDER_PAGE = _Paths.DETAIL_ORDER_PAGE;
  static const HISTORY_PAGE = _Paths.HISTORY_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_PAGE = '/';
  static const HOME_PAGE = '/home-page';
  static const LOGIN_PAGE = '/login-page';
  static const ORDER_PAGE = '/order-page';
  static const HISTORY_PAGE = '/history-page';
  static const DETAIL_ORDER_PAGE = '/detail-order-page';


}