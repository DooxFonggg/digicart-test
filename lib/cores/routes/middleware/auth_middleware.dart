import 'package:digicard/cores/routes/app_routes.dart';
import 'package:digicard/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  // Nhận AuthController thông qua dependency injection
  final _mainProvider = Get.find<MainProvider>();
  @override
  RouteSettings? redirect(String? route) {
    if ((_mainProvider.isLoggedIn.value == false) && route != AppRoutes.login) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
