/// -----------------------------------------------------------------
///
/// File: hour_selection_button_story.dart
/// Project: PUSH
/// File Created: Wednesday, April 28th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 28th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/widgets/stylist_reserve/hour_selection_button.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class HourSelectionButtonStory extends Story {
  HourSelectionButtonStory()
      : super(
          name: 'Hour Selection',
          section: 'Stylist Reserve',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              HourSelectionButton(
            state: knobsBuilder.options(
              label: 'State',
              initial: HourSelectionState.unavailable,
              options: <Option<HourSelectionState>>[
                Option<HourSelectionState>(
                  'Unavailable',
                  HourSelectionState.unavailable,
                ),
                Option<HourSelectionState>(
                  'Unselected',
                  HourSelectionState.unselected,
                ),
                Option<HourSelectionState>(
                  'Selected',
                  HourSelectionState.selected,
                ),
              ],
            ),
            startTime: DateTime.now(),
            endTime: DateTime.now().add(Duration(hours: 1)),
            onPressed: (_, __) {},
          ),
        );
}
