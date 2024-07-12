import 'package:digicard/pages/continue/continue_controller.dart';
import 'package:get/get.dart';

class ContinueBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ContinueController>(ContinueController());
  }
}
