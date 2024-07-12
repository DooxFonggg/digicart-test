import 'dart:developer';

import 'package:get/get.dart';

class MainProvider {
  Rx<bool> isLoggedIn = false.obs;
  init() {
    log('MainProvider init');
  }
}