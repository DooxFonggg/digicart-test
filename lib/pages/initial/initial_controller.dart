import 'package:digicard/cores/base/base_controller.dart';
import 'package:get/get.dart';

class InitialController extends BaseController {
  @override
  Future<void> onReady() async {
    await initData();
    onNavigationPage();
    super.onReady();
  }

  onNavigationPage() {
    gotoHome();
  }

  // resetPassword
  // () {
  //   Get.toNamed('/reset-password');
  // }

  initData() async {}
}
