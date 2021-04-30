/// -----------------------------------------------------------------
///
/// File: calendar_day.dart
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/theme/app_theme.dart';

class CalendarDay extends StatelessWidget {
  final DateTime date;
  final Function onDateTapped;
  final CalendarDayView view;

  Color get textColor {
    switch (view) {
      case CalendarDayView.selected:
        return AppTheme.offWhite;
      case CalendarDayView.today:
        return AppTheme.offBlack;
      case CalendarDayView.highlighted:
        return AppTheme.darkGrey;
      default:
        return AppTheme.mediumGrey;
    }
  }

  Color get backgroundColor {
    switch (view) {
      case CalendarDayView.selected:
        return AppTheme.offBlack;
      case CalendarDayView.today:
        return AppTheme.offWhite;
      case CalendarDayView.highlighted:
        return AppTheme.lightGrey;
      default:
        return AppTheme.offWhite;
    }
  }

  CalendarDay({
    Key key,
    this.date,
    this.onDateTapped,
    this.view = CalendarDayView.today,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onDateTapped,
        child: Container(
          width: (Get.width - 40) / 7,
          height: 48,
          decoration: BoxDecoration(
            shape: (view == CalendarDayView.selected ||
                    view == CalendarDayView.today)
                ? BoxShape.circle
                : BoxShape.rectangle,
            color: backgroundColor,
            border: (view == CalendarDayView.today)
                ? Border.all(color: AppTheme.offBlack, width: 2)
                : Border(),
          ),
          child: Center(
            child: Text(
              date.day.toString(),
              style: AppTheme.headlineFour.copyWith(color: textColor),
            ),
          ),
        ),
      );
}
