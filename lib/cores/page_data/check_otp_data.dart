import 'package:digicard/pages/login/login_controller.dart';

class CheckOtpPageData {
  final String email;
  final GotoPageAfterSendotp gotoPageAfterSendotp;
  final String? password;
  String unique = getUniqueString(); //là duy nhất
  final String? recaptcha;
  CheckOtpPageData({
    required this.email,
    required this.gotoPageAfterSendotp,
    this.password,
    this.recaptcha,
  });
}

enum GotoPageAfterSendotp { login, newspassword, home }
