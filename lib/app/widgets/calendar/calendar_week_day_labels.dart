/// -----------------------------------------------------------------
///
/// File: calendar_week_day_labels.dart
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
import 'package:push_app/app/theme/app_theme.dart';

class CalendarWeekDayLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <String>['M', 'T', 'W', 'T', 'F', 'S', 'S']
              .map(
                (String label) => Text(
                  label,
                  style:
                      AppTheme.headlineFour.copyWith(color: AppTheme.darkGrey),
                ),
              )
              .toList(),
        ),
      );
}
