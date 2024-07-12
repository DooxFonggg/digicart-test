import 'dart:developer';

import 'package:digicard/cores/constans/image_constants.dart';
import 'package:digicard/cores/constans/padding_constants.dart';
import 'package:digicard/cores/constans/sizedbox_constants.dart';
import 'package:digicard/cores/page_data/login_page_data.dart';
import 'package:digicard/pages/components/login_method_widgets.dart';
import 'package:digicard/pages/login/login_controller.dart';
import 'package:digicard/pages/login/widgets/register_account_promt.dart';
import 'package:digicard/pages/login/widgets/term_and_condition.dart';
import 'package:digicard/utils/authen_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  String? _cachedTag;

  @override
  String? get tag {
    if (_cachedTag != null) {
      return _cachedTag;
    }

    var arguments = Get.arguments;
    if (arguments is LoginPageData) {
      _cachedTag = arguments.uniqueKey;
      return _cachedTag;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    log('languae: ${context.locale.languageCode}');
    return Scaffold(
        body: SingleChildScrollView(
      child: _buildBody(context),
    ));

    // return Scaffold(
    //   body: Container(
    //     width: double.infinity,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text('Login Page'),
    //         SizedBoxConstants.sizedBoxH10,
    //         ElevatedButton(
    //           onPressed: () {},
    //           child: const Text('Login'),
    //         ),
    //         SizedBoxConstants.sizedBoxH10,
    //         ElevatedButton(
    //           onPressed: () {
    //             // controller.testApi();
    //           },
    //           child: Text(context.tr('tryOut')),
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             context.setLocale(const Locale('en'));
    //             setState(() {});
    //           },
    //           child: Text('en'),
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             context.setLocale(const Locale('vi'));
    //             setState(() {});
    //           },
    //           child: Text('vi'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Container(
        // width: double.infinity,
        padding: PaddingConstants.padAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBoxConstants.sizedBoxH108,
            _buildLogo(context),
            SizedBoxConstants.sizedBoxH30,
            _buildTitle(context),
            SizedBoxConstants.sizedBoxH44,
            _buildLoginForm(context),
            SizedBoxConstants.sizedBoxH32,
            _buildContinueButton(context),
            SizedBoxConstants.sizedBoxH32,
            _buildTextDriver(context),
            SizedBoxConstants.sizedBoxH24,
            // LoginMethodWidget(
            //     loginGoogle: controller.loginWithGoogle,
            //     loginFacebook: controller.loginWithFacebook)
            LoginMethodButton(method: LoginMethod.google, onPressed: () {}),
            SizedBoxConstants.sizedBoxH24,
            LoginMethodButton(method: LoginMethod.facebook, onPressed: () {}),
            SizedBoxConstants.sizedBoxH32,
            RegisterAccountPrompt(
              gotoRegister: controller.onRegister,
            ),
            SizedBoxConstants.sizedBoxH133,
            // Spacer(),
            const TermAndCondition(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            ImageConstants.appLogo,
            // width: 230,
            height: 47,
          ),
          SizedBoxConstants.sizedBoxH16,
          Text(
            "Empowered by TinaSoft",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                // color: Theme.of(context).primary.withOpacity(0.9),
                color: Colors.blue,
                fontSize: 15),
          ),
        ],
      ),

      // child: Image.asset(
      //   ImageConstants.appLogo,
      //   width: 500,
      //   height: 90,
      // ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Chào mừng bạn đến với Digicard',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 24,
          ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
        key: controller.loginFormKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEmailLabel(context),
              SizedBoxConstants.sizedBoxH04,
              _buildEmailTextField(context),
            ],
          ),
        ));
  }

  RichText _buildEmailLabel(BuildContext context) {
    return RichText(
        text: TextSpan(
            // text: context.translate.emailOrUsername,
            text: "Email hoặc sđt",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                )));
  }

  Widget _buildEmailTextField(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
          onChanged: controller.onEmailChanged,
          controller: controller.emailController,
          decoration: const InputDecoration(
            hintText: 'Nhập email hoặc sđt',
            hintStyle: TextStyle(
              fontSize: 14, // Size of hint text
              fontWeight: FontWeight.w400, // Weight of hint text
              color: Color(0xFF9E9E9E), // Color of hint text
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),

              // hintText: 'Nhập email hoặc sđt',
            ),
          )),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Obx(() => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            controller.isLackField.value
                ? null
                : controller
                    .onContinue(); //nếu thiếu trường thì không thực hiện
            // controller.onContinue();
          },
          // ignore: sort_child_properties_last
          child: Text(
            'Tiếp tục',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  controller.isLackField.value
                      ? Color(0xFFEEEEEE)
                      : Color(0xFF0070FF)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))),
        )));
  }

  Widget _buildTextDriver(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(child: Divider()),
          SizedBoxConstants.sizedBoxW08,
          Text(
            'Hoặc đăng nhập bằng',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF9E9E9E),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBoxConstants.sizedBoxW08,
          const Expanded(child: Divider()),
        ],
      ),
    );
  }

  // Widget _buildGoogleButton(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {

  //     },
  //     child: Container(
  //       height: 50,
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFEEEEEE),
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           SizedBoxConstants.sizedBoxW14,
  //           Image.asset(ImageConstants.icGoogle),
  //           const Spacer(),
  //           Text('Google',
  //               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
  //                     color: const Color(0xFF212121),
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 18,
  //                   )),
  //           SizedBoxConstants.sizedBoxW36,
  //           const Spacer(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
