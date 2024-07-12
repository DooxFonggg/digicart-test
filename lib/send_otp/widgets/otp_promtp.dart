import 'package:flutter/material.dart';

class OTTPrompt extends StatelessWidget {
  final VoidCallback resendOtp;
  final bool isDisableResend;

  const OTTPrompt(
      {super.key, required this.resendOtp, required this.isDisableResend});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: resendOtp,
        child: Text(
          ' Gửi lại',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: const Color(0xFF0070FF),
              ),
        ));
  }
}
