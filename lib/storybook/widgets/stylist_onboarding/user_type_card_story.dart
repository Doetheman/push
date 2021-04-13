/// -----------------------------------------------------------------
///
/// File: user_type_card_story.dart
/// Project: PUSH
/// File Created: Monday, April 12th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 13th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/stylist_onboarding/user_type_card.dart';
import 'package:push_app/app/data/models/enums.dart';

class UserTypeCardStory extends Story {
  UserTypeCardStory()
      : super(
          name: 'User Type Card',
          section: 'Stylist Onboarding',
          builder: (BuildContext buildContext, KnobsBuilder knobsBuilder) =>
              UserTypeCard(
            userType: knobsBuilder.options(
              label: 'User Type',
              initial: UserType.stylist,
              options: <Option<UserType>>[
                Option<UserType>(
                  'Stylist',
                  UserType.stylist,
                ),
                Option<UserType>(
                  'Owner',
                  UserType.owner,
                ),
              ],
            ),
          ),
        );
}
