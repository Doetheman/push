/// -----------------------------------------------------------------
///
/// File: test_styles_story.dart
/// Project: PUSH
/// File Created: Monday, March 29th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Tuesday, March 30th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TextStylesStory extends Story {
  TextStylesStory()
      : super(
            name: 'Text Styles',
            section: 'Theme',
            builder: (_, KnobsBuilder kB) {
              Map<String, TextStyle> styles = <String, TextStyle>{
                'Headline 1': AppTheme.headlineOne,
                'Headline 2': AppTheme.headlineTwo,
                'Headline 3': AppTheme.headlineThree,
                'Headline 4': AppTheme.headlineFour,
                'Headline 5': AppTheme.headlineOne,
                'Subtitle 1': AppTheme.subtitleOne,
                'Subtitle 2': AppTheme.subtitleTwo,
                'Body Text 1': AppTheme.bodyOne,
                'Body Text 2': AppTheme.bodyTwo,
              };

              return ListView(
                children: styles.keys
                    .map(
                      (String style) => Text(
                        style,
                        maxLines: 1,
                        style: styles[style],
                      ).paddingAll(10),
                    )
                    .toList(),
              ).paddingAll(25);
            });
}
