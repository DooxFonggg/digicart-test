import 'package:digicard/cores/page_data/check_otp_data.dart';
import 'package:digicard/send_otp/send_otp_controller.dart';
import 'package:get/get.dart';

class SendOtpBinding extends Bindings {
  @override
  void dependencies() {
    var arguments = Get.arguments;
    if (arguments is CheckOtpPageData) {
      Get.put<SendOtpController>(SendOtpController(pageData: arguments),
          tag: arguments.unique);
    }
  }
}
