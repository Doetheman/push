/// -----------------------------------------------------------------
///
/// File: main.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 27th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/pages.dart';
import 'package:push_app/app/pages/root_bindings.dart';
import 'package:push_app/app/routes.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/generated/i18n.dart';

void main() async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase to the default service file in project directory
  // TODO: Add with Firebase implementation
  // await Firebase.initializeApp();

  // await Get.putAsync(() async {
  //   RemoteConfigProvider remoteConfigProvider =
  //       RemoteConfigProvider.init(!kReleaseMode);
  //   await remoteConfigProvider.initalizeDefaultParameters();
  //   return remoteConfigProvider;
  // });

  // FirebaseAnalytics firebaseAnalytics = Get.put(FirebaseAnalytics());

  final GeneratedLocalizationsDelegate i18n = I18n.delegate;

  runApp(
    GestureDetector(
      // close keyboard anywhere in app when clicking outside of a textfield
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(Get.context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusScope.of(Get.context).requestFocus(FocusNode());
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SIGN_IN,
        theme: AppTheme().themeData,
        getPages: Pages.pages,
        title: 'PUSH',
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          i18n,
        ],
        // TODO: Add with Firebase Analytics
        // navigatorObservers: <NavigatorObserver>[
        //   FirebaseAnalyticsObserver(analytics: firebaseAnalytics),
        // ],
        initialBinding: RootBindings(),
        smartManagement: SmartManagement.onlyBuilder,
        supportedLocales: i18n.supportedLocales,
        localeResolutionCallback: i18n.resolution(
          fallback: Locale('en', 'US'),
        ),
      ),
    ),
  );
}
