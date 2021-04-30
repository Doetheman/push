/// -----------------------------------------------------------------
///
/// File: hours_available_filter_story.dart
/// Project: PUSH
/// File Created: Wednesday, April 21st, 2021
/// Description:
///
/// Author: Luchi - you@you.you
/// -----
/// Last Modified: Thursday, April 29th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

/// -----------------------------------------------------------------
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/fields/hours_available_filter.dart';

class HoursAvailableFilterStory extends Story {
  HoursAvailableFilterStory()
      : super(
          name: 'Hours Available Filter',
          section: 'Fields',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              HoursAvailableFilter(
            selectedValues: RangeValues(1, 3),
            onChangeValues: (_) {},
          ),
        );
}
