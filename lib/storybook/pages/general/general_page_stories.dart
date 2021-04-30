/// -----------------------------------------------------------------
///
/// File: general_page_stories.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/storybook/pages/general/sign_in_page_story.dart';
import 'package:push_app/storybook/pages/general/sign_up_page_story.dart';

List<Widget> buildGeneralPageStories() => <Widget>[
      SignInPageStory(),
      SignUpPageStory(),
    ];
