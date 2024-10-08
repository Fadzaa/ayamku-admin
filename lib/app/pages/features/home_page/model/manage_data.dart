import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'manage.dart';

final List <Manage> manage_data = [
  Manage(
      name: "Voucher",
      image: icVoucher,
      routes: Routes.MANAGEMENT_VOUCHER,
  ),
  Manage(
      name: "Pos",
      image: icHistory,
      routes: Routes.POS_PAGE,
  ),
  Manage(
      name: "Produk",
      image: icProduct,
      routes: Routes.PRODUCT_PAGE,
  ),
];