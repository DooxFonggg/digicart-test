import 'package:digicard/cores/page_data/register_page_data.dart';
import 'package:digicard/pages/signup/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    var arguments = Get.arguments;
    if (arguments is RegisterPagePageData) {
      Get.lazyPut(() => RegisterController(), tag: arguments.uniqueKey);
    } else {
      Get.lazyPut(() => RegisterController());
    }
  }
}
