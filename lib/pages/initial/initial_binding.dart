import 'package:digicard/pages/initial/initial_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InitialController>(InitialController());
  }
}