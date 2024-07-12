// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:digicard/cores/constans/image_constants.dart';
import 'package:digicard/cores/constans/padding_constants.dart';
import 'package:digicard/cores/constans/sizedbox_constants.dart';
import 'package:digicard/cores/page_data/register_page_data.dart';
import 'package:digicard/pages/components/login_method_widgets.dart';
import 'package:digicard/pages/login/widgets/term_and_condition.dart';
import 'package:digicard/pages/signup/register_controller.dart';
import 'package:digicard/pages/signup/widgets/login_account_promt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);

  String? _cachedTag;

  @override
  String? get tag {
    if (_cachedTag != null) {
      return _cachedTag;
    }

    var arguments = Get.arguments;
    if (arguments is RegisterPagePageData) {
      _cachedTag = arguments.uniqueKey;
      return _cachedTag;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: controller.onBack,
          ),
        ),
        body: SingleChildScrollView(
          child: _buildBody(context),
        ));
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
            _buildRegisterButton(context),
            SizedBoxConstants.sizedBoxH32,
            _buildTextDriver(context),
            SizedBoxConstants.sizedBoxH24,
            LoginMethodButton(method: LoginMethod.google, onPressed: () {}),
            SizedBoxConstants.sizedBoxH24,
            LoginMethodButton(method: LoginMethod.facebook, onPressed: () {}),
            SizedBoxConstants.sizedBoxH32,
            LoginAccountPrompt(gotoLogin: () {
              controller.gotoLoginPage();
            }),
            SizedBoxConstants.sizedBoxH32,
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
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Đăng kí tài khoản',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 24,
          ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
        key: controller.registerFormKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEmailLabel(context),
              SizedBoxConstants.sizedBoxH04,
              _buildEmailTextField(context),
              SizedBoxConstants.sizedBoxH18,
              _buildUsernameLabel(context),
              SizedBoxConstants.sizedBoxH04,
              _buildUsernameTextField(context),
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

  RichText _buildUsernameLabel(BuildContext context) {
    return RichText(
        text: TextSpan(
            // text: context.translate.emailOrUsername,
            text: "Tên của bạn",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                )));
  }

  Widget _buildUsernameTextField(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
          onChanged: controller.onUsernameChanged,
          controller: controller.usernameController,
          decoration: const InputDecoration(
            hintText: 'Tên của bạn',
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

  Widget _buildRegisterButton(BuildContext context) {
    return Obx(() => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // controller.onContinue();
          },
          // ignore: sort_child_properties_last
          child: Text(
            'Đăng kí ngay',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  controller.isLackField.value
                      ? const Color(0xFFEEEEEE)
                      : const Color(0xFF0070FF)),
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
}
