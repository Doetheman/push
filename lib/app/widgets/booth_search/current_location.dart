/// -----------------------------------------------------------------
///
/// File: current_location.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Thursday, April 29th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// Last Modified: Thursday, April 29th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';

class CurrentLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          SvgPicture.asset(
            LOCATION_ICON,
            color: AppTheme.primaryBlue,
            height: 13.33,
            width: 9.33,
          ).paddingOnly(right: 11.33),
          Text(I18n.of(context).boothSearchCurrentLocation,
              style: AppTheme.bodyOne.copyWith(color: AppTheme.primaryBlue)),
        ],
      );
}
