import 'package:digicard/cores/constans/image_constants.dart';
import 'package:digicard/cores/constans/padding_constants.dart';
import 'package:digicard/cores/constans/sizedbox_constants.dart';
import 'package:digicard/cores/page_data/check_otp_data.dart';

import 'package:digicard/send_otp/send_otp_controller.dart';
import 'package:digicard/shared_view/count_down_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SendOtpPage extends GetView<SendOtpController> {
  SendOtpPage({super.key});

  String? _cachedTag;

  @override
  String? get tag {
    if (_cachedTag != null) {
      return _cachedTag;
    }

    var arguments = Get.arguments;
    if (arguments is CheckOtpPageData) {
      _cachedTag = arguments.unique;
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
    return Form(
      key: controller.sendOtpFormKey,
      child: Center(
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
              SizedBoxConstants.sizedBoxH12,
              _buildTextOtpTitle(context),
              SizedBoxConstants.sizedBoxH44,
              _buildOtpTextField(context),
              SizedBoxConstants.sizedBoxH24,
              _buildReSendAndCountDown(context),
              SizedBoxConstants.sizedBoxH32,
              _buildVerifyButton(context),
            ],
          ),
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
      'Nhập mã OTP',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF212121),
            fontSize: 24,
          ),
    );
  }

  Widget _buildTextOtpTitle(BuildContext context) {
    return Text(
      'Mã OTP đã được gửi đến +84 963 653 123. Vui lòng nhập mã để tiếp tục đăng nhập.',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xFF212121),
            fontSize: 16,
          ),
    );
  }

  Widget _buildOtpTextField(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
          onChanged: controller.onOtpChange,
          controller: controller.otpController, //đang sai
          // maxLength: 4,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Nhập mã OTP',
            hintStyle: const TextStyle(
              fontSize: 14, // Size of hint text
              fontWeight: FontWeight.w400, // Weight of hint text
              color: Color(0xFF9E9E9E), // Color of hint text
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),

              // hintText: 'Nhập email hoặc sđt',
            ),
            filled: true,
            fillColor: const Color(0xFFEEEEEE),
            suffixIcon: GestureDetector(
                onTap: () {
                  controller.onClearOtp();
                },
                child: Image.asset(ImageConstants.icXSmart)),
          )),
    );
  }

  Widget _buildReSendAndCountDown(BuildContext context) {
    return Row(
      children: [
        Text(
          'Chưa nhận được mã ?',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color(0xFF212121),
                fontSize: 18,
              ),
        ),
        _buildCountDown(context),
      ],
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    return Obx(() => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: controller.isLackOtp
              ? null
              : () {
                  controller.completeOtp(context);
                },
          // ignore: sort_child_properties_last
          child: Text(
            'Xác nhận',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(controller.isLackOtp
                  ? const Color(0xFFEEEEEE)
                  : const Color(0xFF0070FF)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))),
        )));
  }

  Widget _buildCountDown(BuildContext context) {
    return Obx(() => controller.showTimeCount.value
        ? CountDownTimer(
            key: controller.keyWidgetCountDown.value,
            secondsRemaining: 120,
            getTimer: controller.checkTimeCountDown,
            resendOtp: () {
              controller.sendOtp(context);
            })
        : Container());
  }
}
