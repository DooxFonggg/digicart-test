// ignore_for_file: unused_element

import 'package:digicard/cores/constans/image_constants.dart';
import 'package:digicard/cores/constans/padding_constants.dart';
import 'package:digicard/cores/constans/sizedbox_constants.dart';
import 'package:digicard/cores/page_data/continue_page_data.dart';
import 'package:digicard/pages/components/login_method_widgets.dart';
import 'package:digicard/pages/continue/continue_controller.dart';
import 'package:digicard/pages/login/widgets/register_account_promt.dart';
import 'package:digicard/pages/login/widgets/term_and_condition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinuePage extends GetView<ContinueController> {
  ContinuePage({super.key});
  String? _cachedTag; //tag check_otp_data.dart

  @override
  String? get tag {
    if (_cachedTag != null) {
      return _cachedTag;
    }

    var arguments = Get.arguments;
    if (arguments is ContinuePageData) {
      _cachedTag = arguments.uniqueKey;
      return _cachedTag;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    //  log('languae: ${context.locale.languageCode}');
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
            SizedBoxConstants.sizedBoxH14,
            _buildFogotPasswordButton(context),
            SizedBoxConstants.sizedBoxH26,
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
            SizedBoxConstants.sizedBoxH107,
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
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Nhập mật khẩu để tiếp tục',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 24,
          ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
        key: controller.continueFormKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPasswordLabel(context),
              SizedBoxConstants.sizedBoxH04,
              _buildPasswordTextField(context),
            ],
          ),
        ));
  }

  Widget _buildFogotPasswordButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRememberMeCheckbox(context),
        GestureDetector(
          onTap: () {},
          child: Text('Quên mật khẩu?',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF212121),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
        )
      ],
    );
  }

  RichText _buildPasswordLabel(BuildContext context) {
    return RichText(
        text: TextSpan(
            // text: context.translate.emailOrUsername,
            text: "Mật khẩu",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                )));
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return Obx(() => SizedBox(
        height: 50,
        child: TextFormField(
          obscureText: !controller.passwordVisible.value,
          onChanged: controller.onPasswordChanged,
          controller: controller.passwordController,
          decoration: InputDecoration(
              hintText: 'Mật khẩu',
              hintStyle: const TextStyle(
                fontSize: 14, // Size of hint text
                fontWeight: FontWeight.w400, // Weight of hint text
                color: Color(0xFF9E9E9E), // Color of hint text
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF9E9E9E), width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              suffixIcon: GestureDetector(
                  onTap: () {
                    controller.togglePasswordVisibility();
                  },
                  child: Icon(controller.passwordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off))),
        )));
  }

  Widget _buildContinueButton(BuildContext context) {
    return Obx(() => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            controller.isLackField.value ? null : controller.onGetOtp();
            // controller.onContinue();
          },
          // ignore: sort_child_properties_last
          child: Text(
            'Đăng nhập',
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

  Widget _buildRememberMeCheckbox(BuildContext context) {
    return Obx(() => Row(
          children: [
            Checkbox(
              value: controller.isSaveAccount.value,
              onChanged: controller.onSaveAccountChanged,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              activeColor: const Color(0xFF0070FF),
              // Text(context.translate.rememberMe),
            ),
            SizedBoxConstants.sizedBoxW08,
            Text(
              'Lưu thông tin đăng nhập',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF212121),
                  ),
            )
          ],
        ));
  }
}
