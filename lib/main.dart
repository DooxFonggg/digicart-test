import 'dart:async';

import 'package:digicard/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await EasyLocalization.ensureInitialized();
      await initApp();
      FlutterNativeSplash.remove();
      runApp(EasyLocalization(
          supportedLocales: [Locale('en'), Locale('vi')],
          path: 'assets/translations',
          saveLocale: false,
          child: DigicardApp()));
    },
    (error, stack) {
      // do something to
    },
  );
}
