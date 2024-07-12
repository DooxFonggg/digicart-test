import 'package:digicard/cores/constans/sizedbox_constants.dart';
import 'package:flutter/material.dart';

class RegisterAccountPrompt extends StatelessWidget {
  final VoidCallback gotoRegister;
  const RegisterAccountPrompt({super.key, required this.gotoRegister});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bạn chưa có tài khoản?',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF616161),
              ),
        ),
        SizedBoxConstants.sizedBoxW04,
        // TextButton(
        //     onPressed: gotoRegister,
        //     child: Text(
        //       'Đăng kí ngay',
        //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        //             fontWeight: FontWeight.w700,
        //             fontSize: 14,
        //             color: const Color(0xFF0070FF),
        //           ),
        //     ))
        GestureDetector(
            onTap: gotoRegister,
            child: Text(
              'Đăng kí ngay',
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
