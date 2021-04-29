/// -----------------------------------------------------------------
///
/// File: hour_selection_button.dart
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
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/utils/date_time_utils.dart';
import 'package:push_app/generated/i18n.dart';

class HourSelectionButton extends StatelessWidget {
  final HourSelectionState state;
  final DateTime startTime;
  final DateTime endTime;
  final Function(DateTime, DateTime) onPressed;
  final int numOfSelected;

  bool get isUnavailable => state == HourSelectionState.unavailable;
  bool get isUnselected => state == HourSelectionState.unselected;
  bool get isSelected => state == HourSelectionState.selected;

  Color get backgroundColor {
    switch (state) {
      case HourSelectionState.unavailable:
        return AppTheme.lightGrey;
      case HourSelectionState.selected:
        return AppTheme.primaryBlue;
      default:
        return AppTheme.offWhite;
    }
  }

  Color get foregroundColor {
    switch (state) {
      case HourSelectionState.unavailable:
        return AppTheme.mediumGrey;
      case HourSelectionState.selected:
        return AppTheme.offWhite;
      default:
        return AppTheme.primaryBlue;
    }
  }

  HourSelectionButton({
    this.state,
    this.startTime,
    this.endTime,
    this.onPressed,
    this.numOfSelected,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        width: 158,
        child: SizedBox.expand(
          child: ElevatedButton(
            onPressed:
                !isUnavailable ? () => onPressed(startTime, endTime) : null,
            style: ElevatedButton.styleFrom(
              primary: backgroundColor,
              onPrimary: foregroundColor,
              side: isUnselected
                  ? BorderSide(
                      color: AppTheme.secondaryBlue,
                      width: 2,
                    )
                  : null,
            ),
            child: Text(
              I18n.of(context).hourSelectionButtonSelectionTime(
                DateTimeUtils.getHour(startTime),
                DateTimeUtils.getHour(endTime),
              ),
              style: AppTheme.bodyOne.copyWith(
                color: foregroundColor,
              ),
            ),
          ),
        ),
      );
}
