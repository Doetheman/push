/// -----------------------------------------------------------------
///
/// File: main_story.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Monday, March 15th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/generated/i18n.dart';
import 'package:push_app/storybook/pages/general/general_page_stories.dart';
import 'package:push_app/storybook/pages/stylist/stylist_page_stories.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: AppTheme().themeData,
      darkTheme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      title: 'PUSH Storybook',
      home: StorybookApp(),
    ),
  );
}

class StorybookApp extends StatelessWidget {
  final GeneratedLocalizationsDelegate i18n = I18n.delegate;

  @override
  Widget build(BuildContext context) => Storybook(
        theme: AppTheme().themeData,
        darkTheme: AppTheme().themeData,
        localizationDelegates: <LocalizationsDelegate<dynamic>>[i18n],
        children: <Story>[
          ...buildGeneralPageStories(),
          ...buildStylistPageStories(),
        ],
      );
}
