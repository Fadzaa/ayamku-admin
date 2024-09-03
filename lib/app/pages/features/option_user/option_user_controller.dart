import 'package:ayamku_admin/app/api/auth/authentication_service.dart';
import 'package:ayamku_admin/app/api/auth/model/user_list_response.dart';
import 'package:ayamku_admin/app/api/voucher/model/voucher_response.dart';
import 'package:ayamku_admin/app/api/voucher/voucher_service.dart';
import 'package:ayamku_admin/app/router/app_pages.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class OptionUserController extends GetxController{

  RxBool isLoading = false.obs;

  AuthenticationService authService = AuthenticationService();
  Rx<UserListResponse> userListResponse = UserListResponse().obs;
  List<int> listUserId = [];

  VoucherService voucherService = VoucherService();
  int voucherId = Get.arguments;

  @override
  void onInit() {
    super.onInit();

    getAllUser();
  }

  Future<void> getAllUser() async {
    try {
      isLoading.value = true;

      final response = await authService.getAllUserAsc();

      userListResponse.value = response;

      print("CHECK CURRENT RESPONE");
      print(userListResponse.value.data!.length);

      for (var i = 0; i < userListResponse.value.data!.length; i++) {
        print(userListResponse.value.data![i].name);
      }

    }
    catch(e){
      isLoading.value = true;
      Get.snackbar(
        "Error",
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> giveVoucher() async {
    try {
      isLoading.value = true;

      if(listUserId.length != 0 ) {
        for (var i = 0; i < listUserId.length; i++) {
         await voucherService.giveVoucher(voucherId: voucherId, userId: listUserId[i]);
        }
      }
      
    }
    catch(e){
      isLoading.value = true;
      Get.snackbar(
        "Error",
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

}