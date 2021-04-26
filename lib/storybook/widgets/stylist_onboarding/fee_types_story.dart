/// -----------------------------------------------------------------
///
/// File: fee_types_story.dart
/// Project: PUSH
/// File Created: Thursday, April 15th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Sunday, April 25th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/stylist_onboarding/fee_types.dart';

class FeeTypesStory extends Story {
  FeeTypesStory()
      : super(
          name: 'Fee Types',
          section: 'Stylist Onboarding',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              SingleChildScrollView(
            child: FeeTypes(),
          ),
        );
}
