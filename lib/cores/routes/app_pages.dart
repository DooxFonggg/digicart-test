import 'package:digicard/cores/routes/app_routes.dart';
import 'package:digicard/cores/routes/middleware/auth_middleware.dart';
import 'package:digicard/pages/continue/continue_binding.dart';
import 'package:digicard/pages/continue/continue_page.dart';
import 'package:digicard/pages/home/home_binding.dart';
import 'package:digicard/pages/home/home_page.dart';
import 'package:digicard/pages/initial/initial_binding.dart';
import 'package:digicard/pages/initial/initial_page.dart';
import 'package:digicard/pages/login/login_binding.dart';
import 'package:digicard/pages/login/login_page.dart';
import 'package:digicard/pages/signup/register_binding.dart';
import 'package:digicard/pages/signup/register_page.dart';
import 'package:digicard/send_otp/send_otp_binding.dart';
import 'package:digicard/send_otp/send_otp_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.root,
        page: () => InitialPage(),
        binding: InitialBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: AppRoutes.home,
        page: () => HomePage(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()],
        transition: Transition.noTransition),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: AppRoutes.continues,
        page: () => ContinuePage(),
        binding: ContinueBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: AppRoutes.sendOtp,
        page: () => SendOtpPage(),
        binding: SendOtpBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: AppRoutes.registerPassword,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
