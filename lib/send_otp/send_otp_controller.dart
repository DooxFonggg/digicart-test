import 'package:digicard/cores/base/base_controller.dart';
import 'package:digicard/cores/page_data/check_otp_data.dart';
import 'package:digicard/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendOtpController extends BaseController {
  final CheckOtpPageData pageData;
  final sendOtpFormKey = GlobalKey<FormState>(debugLabel: getUniqueString());
  final TextEditingController otpController = TextEditingController();

  SendOtpController({required this.pageData});
  //logic xóa mã otp
  void onClearOtp() {
    otpController.clear();
  }

  //logic otp textfield onchange
  final Rx<String> currentOtp = Rx<String>('');

  void onOtpChange(String otp) {
    currentOtp.value = otp;
  }

  //đếm ngược otp
  final Rx<bool> showTimeCount = Rx<bool>(true);
  final Rx<Key> keyWidgetCountDown = Rx<Key>(UniqueKey());
  final Rx<bool> disableSend = Rx<bool>(false);

  void checkTimeCountDown(int time) {
    if (time == 0) {
      disableSend.value = true;
    }
  }

  //xử lý logic khi nhấn nút gửi lại mã otp
  final Rx<bool> disableResend = Rx<bool>(true);
  Future<void> sendOtp(BuildContext context) async {}

  //xử lý logic khi nhấn nút xác nhận
  final totalPin = 4;
  bool get isLackOtp =>
      currentOtp.value.length < totalPin; // chưa đủ trả về true
  Future<void> completeOtp(BuildContext context) async {}

  //xử lý logic khi nhấn nút quay lại
  onBack() {
    Get.back();
  }
}
