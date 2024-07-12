import 'package:digicard/cores/base/base_exception.dart';
import 'package:digicard/cores/base/mixin_navigator.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController with NavigationPage {
  Future<void> defaultErrorHandler(dynamic e, {dynamic data}) async {
    if (e is BaseNetworkException) {
      // có thể truyền data là bất cứ thứ gì rồi if else để xử lý tuy ý
      if(e.code == '-1') {
        if(data is Function) {
          data.call();
        }
      }
    } else {
      // showSnackBar(e.toString());
    }
  }
}
