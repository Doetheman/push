/// -----------------------------------------------------------------
///
/// File: email_input_story.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/widgets.dart';
import 'package:push_app/app/widgets/sign_up/email_input.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class EmailInputStory extends Story {
  EmailInputStory()
      : super(
          name: 'Email Input',
          section: 'Sign Up',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              Container(
            child: EmailInput(),
          ),
        );
}
