import 'package:digicard/cores/constans/sizedbox_constants.dart';
import 'package:flutter/material.dart';

class LoginAccountPrompt extends StatelessWidget {
  final VoidCallback gotoLogin;
  const LoginAccountPrompt({super.key, required this.gotoLogin});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bạn đã có tài khoản?',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF616161),
              ),
        ),
        SizedBoxConstants.sizedBoxW04,
        GestureDetector(
            onTap: gotoLogin,
            child: Text(
              'Đăng nhập ngay',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: const Color(0xFF0070FF),
                  ),
            ))
      ],
    );
  }
}
