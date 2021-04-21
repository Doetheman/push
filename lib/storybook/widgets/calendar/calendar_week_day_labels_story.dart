/// -----------------------------------------------------------------
///
/// File: calendar_week_day_labels_story.dart
/// Project: PUSH
/// File Created: Wednesday, April 21st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 21st, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/calendar/calendar_week_day_labels.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CalendarWeekDayLabelsStory extends Story {
  CalendarWeekDayLabelsStory()
      : super(
          name: 'Calendar Week Day Labels',
          section: 'Calendar',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              CalendarWeekDayLabels(),
        );
}
