/// -----------------------------------------------------------------
///
/// File: misc_stories.dart
/// Project: PUSH
/// File Created: Thursday, April 1st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Saturday, April 10th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:push_app/storybook/widgets/misc/action_button_story.dart';
import 'package:push_app/storybook/widgets/misc/bottom_nav_bar_story.dart';
import 'package:push_app/storybook/widgets/misc/header_label_story.dart';
import 'package:push_app/storybook/widgets/misc/top_app_bar_story.dart';

List<Widget> buildMiscStories() => <Widget>[
      ActionButtonStory(),
      TopAppBarStory(),
      BottomNavBarStory(),
      HeaderLabelStory(),
    ];
