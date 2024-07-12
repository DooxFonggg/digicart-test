import 'package:digicard/cores/page_data/check_otp_data.dart';
import 'package:digicard/cores/page_data/login_page_data.dart';
import 'package:digicard/cores/page_data/register_page_data.dart';
import 'package:digicard/cores/routes/app_routes.dart';
import 'package:get/get.dart';

mixin NavigationPage {
  gotoHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  gotoContiune() {
    Get.toNamed(AppRoutes.continues);
  }

  gotoLoginPage() {
    Get.toNamed(AppRoutes.login, arguments: LoginPageData());
  }

  gotoSendOtpPage(CheckOtpPageData pageData) {
    Get.toNamed(AppRoutes.sendOtp, arguments: pageData);
  }

  gotoRegister() {
    // TrackingUtil().event(EventConstants.GO_TO_REGISTER, parameters: {});
    Get.toNamed(AppRoutes.registerPassword, arguments: RegisterPagePageData());
  }
}
