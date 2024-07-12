// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:digicard/cores/constans/image_constants.dart';
import 'package:digicard/cores/constans/sizedbox_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum LoginMethod { google, facebook }

class LoginMethodWidget extends StatelessWidget {
  final VoidCallback loginGoogle;
  final VoidCallback loginFacebook;
  const LoginMethodWidget(
      {super.key, required this.loginGoogle, required this.loginFacebook});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: LoginMethod.values
            .where((element) {
              if (Platform.isAndroid) {
                return element == LoginMethod.google;
              } else {
                return true;
              }
            })
            .toList()
            .map((method) {
              return LoginMethodButton(
                  method: method,
                  onPressed: () {
                    switch (method) {
                      case LoginMethod.google:
                        loginGoogle?.call();
                        break;
                      case LoginMethod.facebook:
                        loginFacebook?.call();
                        break;
                    }
                  });
            })
            .toList());
  }
}

class LoginMethodButton extends StatelessWidget {
  final LoginMethod method;
  final VoidCallback onPressed;

  const LoginMethodButton(
      {super.key, required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Widget icon;
    String title;
    switch (method) {
      case LoginMethod.google:
        icon = Image.asset(
          ImageConstants.icGoogle,
          width: 32,
          height: 32,
        );
        title = 'Google';
        break;
      case LoginMethod.facebook:
        icon = Image.asset(
          ImageConstants.icFacebook,
          width: 32,
          height: 32,
        );
        title = 'Facebook';
        break;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBoxConstants.sizedBoxW14,
            icon,
            const Spacer(),
            Text(title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF212121),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    )),
            SizedBoxConstants.sizedBoxW36,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
