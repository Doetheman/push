/// -----------------------------------------------------------------
///
/// File: story_wrapper.dart
/// Project: PUSH
/// File Created: Sunday, April 25th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Sunday, April 25th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StoryWrapper {
  static Widget phoneContainer({
    KnobsBuilder knobsBuilder,
    Widget child,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        width: knobsBuilder.slider(
          label: 'Device Width (px)',
          min: 320,
          max: 480,
          initial: 414,
        ),
        height: knobsBuilder.slider(
          label: 'Device Height (px)',
          min: 568,
          max: 896,
          initial: 896,
        ),
        child: child,
      );
}
