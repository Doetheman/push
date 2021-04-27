/// -----------------------------------------------------------------
///
/// File: sign_up_stories.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/storybook/widgets/sign_up/email_input_story.dart';
import 'package:push_app/storybook/widgets/sign_up/password_input_story.dart';
import 'package:push_app/storybook/widgets/sign_up/specialty_carousel_story.dart';

List<Widget> buildSignUpStories() => <Widget>[
      SpecialtyCarouselStory(),
      PasswordInputStory(),
      EmailInputStory(),
    ];
