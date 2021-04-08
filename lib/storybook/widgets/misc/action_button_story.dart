/// -----------------------------------------------------------------
///
/// File: action_button_story.dart
/// Project: PUSH
/// File Created: Thursday, April 1st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:push_app/app/theme/app_theme.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/misc/action_button.dart';

class ActionButtonStory extends Story {
  ActionButtonStory()
      : super(
          name: 'Action Button',
          section: 'Misc',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              Container(
            width: 400,
            height: 1000,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ActionButton(
                  isDisabled: knobsBuilder.boolean(
                    label: 'isDisabled',
                    initial: false,
                  ),
                  text: 'Continue',
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: ActionButton(
                        text: 'Yes',
                        color: AppTheme.primaryBlue,
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ActionButton(
                        text: 'No',
                        color: AppTheme.secondaryBlue,
                        textColor: AppTheme.primaryBlue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
}
