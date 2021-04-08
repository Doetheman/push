/// -----------------------------------------------------------------
///
/// File: theme_stories.dart
/// Project: PUSH
/// File Created: Monday, March 29th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/storybook/theme/colors_story.dart';
import 'package:push_app/storybook/theme/test_styles_story.dart';

List<Widget> buildThemeStories() => <Widget>[
      ColorsStory(),
      TextStylesStory(),
    ];
