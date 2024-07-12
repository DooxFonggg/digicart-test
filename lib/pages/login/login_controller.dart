import 'package:digicard/cores/base/base_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class LoginController extends BaseController {
  final loginFormKey = GlobalKey<FormState>(debugLabel: getUniqueString());
  // testApi() async {
  //   final TestServices testServices = TestServicesIml();
  //   try {
  //     log('test Api');
  //     final data = await testServices.testFunc();
  //     log(data.toString());
  //   } on BaseNetworkException catch (e) {
  //     log('ngoại lệ tự bắt !');
  //     defaultErrorHandler(e, data: () {
  //       log('controller handle: ${e.toString()}');
  //     });
  //   } catch (e) {
  //     log('ngoại lệ không rõ!');
  //     log(e.toString());
  //   }
  // }
  TextEditingController emailController = TextEditingController();

  final emailOrPhone = ''.obs;
  // final password = ''.obs;
  Rx<bool> isLackField = true.obs; //check xem có thiếu trường nào không

  void onEmailChanged(String? newValue) {
    emailOrPhone.value =
        newValue ?? ''; //newValue nếu null thì gán giá trị rỗng
    isLackField.value =
        emailOrPhone.value.isEmpty ? true : false; // trả về false khi email đa
  }

  // @override
  // void onInit() {
  //   emailController.addListener(onEmailChanged as VoidCallback);
  //   super.onInit();
  // }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  onContinue() {
    gotoContiune();
  }

  onRegister() {
    gotoRegister();
  }

  // @override
  // onInit() {

  //   super.onInit();
  // }
  Future<void> onLogin() async {}
}

String getUniqueString() {
  var uuid = const Uuid();
  var v4 = uuid.v4();
  return '$v4 ${DateTime.now().millisecondsSinceEpoch}';
}
