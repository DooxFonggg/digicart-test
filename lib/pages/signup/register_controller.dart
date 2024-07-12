import 'package:digicard/cores/base/base_controller.dart';
import 'package:digicard/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final Rx<String> username = ''.obs;
  final Rx<String> email = ''.obs;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  //logic check
  Rx<bool> isLackField = true.obs;

  void onUsernameChanged(String? newValue) {
    username.value = newValue ?? '';
    isLackField.value =
        username.value.isEmpty || email.value.isEmpty ? true : false;
  }

  void onEmailChanged(String? newValue) {
    email.value = newValue ?? '';
    isLackField.value =
        username.value.isEmpty || email.value.isEmpty ? true : false;
  }

  //back ve
  onBack() {
    Get.back();
  }

  //go to login
  onLoginPage() {
    gotoLoginPage();
  }
}
