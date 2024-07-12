import 'dart:developer';

import 'package:digicard/cores/routes/app_pages.dart';
import 'package:digicard/cores/routes/app_routes.dart';
import 'package:digicard/data/source/local/local_storage.dart';
import 'package:digicard/provider/main_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DigicardApp extends StatelessWidget {
  DigicardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Digicard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale('vi'),
      initialRoute: AppRoutes.root,
      getPages: AppPages.pages,
    );
  }
}

initApp() async {
  // Local storage
  Get.put<LocalStorage>(LocalStorageImpl());

  // Main provider
  Get.put(MainProvider());
}
