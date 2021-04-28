/// -----------------------------------------------------------------
///
/// File: calendar_day_story.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 28th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/widgets.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/widgets/misc/calendar_day.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CalendarDayStory extends Story {
  CalendarDayStory()
      : super(
            name: 'Calendar Day',
            section: 'Calendar',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
                SizedBox(
                  child: CalendarDay(
                    date: DateTime.now(),
                    view: knobsBuilder.options(
                        label: 'Type',
                        initial: CalendarDayView.today,
                        options: <Option<CalendarDayView>>[
                          Option<CalendarDayView>(
                              'Today', CalendarDayView.today),
                          Option<CalendarDayView>(
                              'Selected', CalendarDayView.selected),
                          Option<CalendarDayView>(
                              'Highlighted', CalendarDayView.highlighted),
                          Option<CalendarDayView>(
                              'Unselected', CalendarDayView.unselected)
                        ]),
                  ),
                ));
}
