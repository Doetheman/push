/// -----------------------------------------------------------------
///
/// File: main_story.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 28th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/generated/i18n.dart';
import 'package:push_app/storybook/pages/general/general_page_stories.dart';
import 'package:push_app/storybook/pages/stylist/stylist_page_stories.dart';
import 'package:push_app/storybook/theme/theme_stories.dart';
import 'package:push_app/storybook/widgets/booth_search/booth_search_stories.dart';
import 'package:push_app/storybook/widgets/calendar/calendar_stories.dart';
import 'package:push_app/storybook/widgets/fields/field_stories.dart';
import 'package:push_app/storybook/widgets/misc/misc_stories.dart';
import 'package:push_app/storybook/widgets/sign_up/sign_up_stories.dart';
import 'package:push_app/storybook/widgets/stylist_onboarding/stylist_onboarding_stories.dart';
import 'package:push_app/storybook/widgets/stylist_home/stylist_home_stories.dart';
import 'package:push_app/storybook/widgets/stylist_reserve/stylist_reserve_stories.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(StorybookApp());
}

class StorybookApp extends StatelessWidget {
  final GeneratedLocalizationsDelegate i18n = I18n.delegate;

  @override
  Widget build(BuildContext context) => Storybook(
        theme: AppTheme().themeData,
        darkTheme: AppTheme().themeData,
        localizationDelegates: <LocalizationsDelegate<dynamic>>[i18n],
        children: <Story>[
          ...buildThemeStories(),
          ...buildGeneralPageStories(),
          ...buildStylistPageStories(),
          ...buildFieldStories(),
          ...buildMiscStories(),
          ...buildStylistOnboardingStories(),
          ...buildStylistHomeStories(),
          ...buildBoothSearchStories(),
          ...buildCalendarStories(),
          ...buildSignUpStories(),
          ...buildStylistReserveStories(),
        ],
      );
}
