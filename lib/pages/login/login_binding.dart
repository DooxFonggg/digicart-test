import 'package:digicard/cores/page_data/login_page_data.dart';
import 'package:digicard/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    var arguments = Get.arguments;
    if (arguments is LoginPageData) {
      Get.lazyPut(() => LoginController(), tag: arguments.uniqueKey);
    } else {
      Get.lazyPut(() => LoginController());
    }
  }
}
