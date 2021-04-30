/// -----------------------------------------------------------------
///
/// File: hours_available_filter.dart
/// Project: PUSH
/// File Created: Wednesday, April 21st, 2021
/// Description:
///
/// Author: Luchi - oluchi@longsoftware.io
/// -----
/// Last Modified: Thursday, April 29th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/generated/i18n.dart';

class HoursAvailableFilter extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final RangeValues selectedValues;
  final Function(RangeValues) onChangeValues;

  const HoursAvailableFilter({
    Key key,
    this.minValue = 1,
    this.maxValue = 10,
    this.selectedValues,
    this.onChangeValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            I18n.of(context).sortFilterHoursAvailable,
            style: AppTheme.subtitleOne,
          ).paddingOnly(bottom: 20),
          Row(
            children: <Widget>[
              Text(
                '${selectedValues.start ?? minValue}-${selectedValues.end ?? maxValue} ',
                style: AppTheme.bodyOne,
              ),
              Text(
                I18n.of(context).sortFilterHoursAvailableToReserve,
                style: AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
              )
            ],
          ).paddingOnly(bottom: 10),
          RangeSlider(
            values: selectedValues,
            min: minValue,
            max: maxValue,
            divisions: 1,
            onChanged: onChangeValues,
          )
        ],
      );
}
