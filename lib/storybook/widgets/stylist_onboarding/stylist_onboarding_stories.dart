/// -----------------------------------------------------------------
///
/// File: stylist_onboarding_stories.dart
/// Project: PUSH
/// File Created: Monday, April 12th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 14th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:push_app/storybook/widgets/stylist_onboarding/fee_type_description_story.dart';
import 'package:push_app/storybook/widgets/stylist_onboarding/stylist_speciality_card_story.dart';
import 'package:push_app/storybook/widgets/stylist_onboarding/user_type_card_story.dart';

List<Widget> buildStylistOnboardingStories() => <Widget>[
      UserTypeCardStory(),
      FeeTypeDescriptionStory(),
      StylistSpecialtyCardStory(),
    ];
