import 'package:ayamku_admin/app/api/voucher/model/voucher_response.dart';
import 'package:ayamku_admin/app/api/voucher/voucher_service.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class OptionUserController extends GetxController{

  RxBool isLoading = false.obs;

  RxList<Voucher> voucherList = <Voucher>[].obs;
  VoucherService voucherService = VoucherService();
  VoucherResponse voucherResponse = VoucherResponse();

  @override
  void onInit() {
    super.onInit();
  }

  // Future <void> giveVoucher() async{
  //   try {
  //     isLoading.value = true;
  //
  //
  //     dio.FormData formData = dio.FormData.fromMap({
  //       "voucher_id" : codeController.text,
  //       "user_id" : int.parse(discountController.text),
  //     });
  //
  //     await voucherService.addVoucher(formData);
  //
  //     Get.snackbar("Voucher diberikan", "Berhasil memberikan voucher");
  //
  //     Get.offNamedUntil(Routes.MANAGEMENT_VOUCHER, (routes) => routes.settings.name == Routes.HOME_PAGE);
  //
  //
  //   }
  //   catch(e){
  //     Get.snackbar(
  //       "Error",
  //       e.toString(),
  //     );
  //   }
  // }
}