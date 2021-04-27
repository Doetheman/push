/// -----------------------------------------------------------------
///
/// File: password_input_story.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 27th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/sign_up/password_input.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class PasswordInputStory extends Story {
  PasswordInputStory()
      : super(
          name: 'Password Input',
          section: 'Sign Up',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              PasswordInput(
            isSignUp: knobsBuilder.boolean(
              label: 'isSignUp',
              initial: false,
            ),
          ),
        );
}
