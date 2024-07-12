import 'package:digicard/cores/base/base_controller.dart';
import 'package:digicard/cores/page_data/check_otp_data.dart';
import 'package:digicard/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinueController extends BaseController {
  final continueFormKey = GlobalKey<FormState>(debugLabel: getUniqueString());

  final password = ''.obs;

  TextEditingController passwordController = TextEditingController();

  onRegister() {
    gotoRegister();
  }

  //logic check pass
  Rx<bool> isLackField = true.obs; //check xem có thiếu trường nào không

  void onPasswordChanged(String? newValue) {
    password.value = newValue ?? '';
    isLackField.value = password.value.isEmpty;
  }

  //logic hiển thị password
  Rx<bool> passwordVisible = false.obs;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  //logic lưu tài khoản

  Rx<bool> isSaveAccount = false.obs;

  void onSaveAccountChanged(bool? newValue) {
    isSaveAccount.value = newValue ?? false;
  }

  //send otp
  Rx<String> email = ''.obs;
  Future<void> onGetOtp() async {
    if (continueFormKey.currentState?.validate() ?? false) {
      // showAlertDialog(
      //     DialogVerifyRecapcha(onMessageReceived: (String recaptcha) {
      //   Get.back();
      //   try {
      //     gotoSendOtpPage(CheckOtpPageData(
      //         recaptcha: recaptcha,
      //         email: email.value.trim().toLowerCase(),
      //         gotoPageAfterSendotp: GotoPageAfterSendotp.newspassword));
      //   } catch (e) {
      //     defaultErrorHandler(e);

      //   }
      // }));

      Get.back();
      try {
        gotoSendOtpPage(CheckOtpPageData(
            recaptcha: null,
            email: email.value.trim().toLowerCase(),
            gotoPageAfterSendotp: GotoPageAfterSendotp.newspassword));
      } catch (e) {
        defaultErrorHandler(e);
      }
    }
  }

  //logic back về
  void onBack() {
    Get.back();
  }
}
