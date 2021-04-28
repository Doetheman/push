/// -----------------------------------------------------------------
///
/// File: calendar_stories.dart
/// Project: PUSH
/// File Created: Wednesday, April 21st, 2021
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
import 'package:push_app/storybook/widgets/calendar/calendar_day_story.dart';
import 'package:push_app/storybook/widgets/calendar/calendar_week_day_labels_story.dart';

List<Widget> buildCalendarStories() => <Widget>[
      CalendarWeekDayLabelsStory(),
      CalendarDayStory(),
    ];
