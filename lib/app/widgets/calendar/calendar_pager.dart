/// -----------------------------------------------------------------
///
/// File: calendar_pager.dart
/// Project: PUSH
/// File Created: Wednesday, April 21st, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 21st, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/calendar_controller.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/storybook/widgets/misc/svg_button.dart';

class CalendarPager extends StatelessWidget {
  final CalendarController calendarController = Get.find();

  CalendarPager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Row(
          children: <Widget>[
            Text(calendarController.selectedMonthYear,
                style: AppTheme.subtitleOne),
            Spacer(),
            SvgButton(
              svg: LEFT_ARROW_ICON,
              onPressed: () => calendarController.onChangeCalendarPage(false),
            ).paddingOnly(right: 30),
            SvgButton(
              svg: RIGHT_ARROW_ICON,
              onPressed: () => calendarController.onChangeCalendarPage(true),
            )
          ],
        ),
      );
}
