/// -----------------------------------------------------------------
///
/// File: bottom_navbar_story.dart
/// Project: PUSH
/// File Created: Monday, April 5th, 2021
/// Description:
///
/// Author: Dorian - dorian@longsoftware.io
/// -----
/// Last Modified: Friday, April 9th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/misc/bottom_nav_bar.dart';

class BottomNavBarStory extends Story {
  BottomNavBarStory()
      : super(
          name: 'Bottom Nav Bar',
          section: 'Misc',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              Scaffold(
            bottomNavigationBar: BottomNavBar(),
          ),
        );
}
