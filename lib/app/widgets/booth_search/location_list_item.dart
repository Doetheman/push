/// -----------------------------------------------------------------
///
/// File: location_list_item.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 20th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';

class LocationListItem extends StatelessWidget {
  final String cityAndState;

  LocationListItem({
    this.cityAndState,
  });
  @override
  Widget build(BuildContext context) => Container(
        width: Get.width,
        height: 30,
        color: AppTheme.offWhite,
        child: Row(
          children: <Widget>[
            SvgPicture.asset(LOCATION_POINTER_ICON).paddingOnly(right: 11),
            Text(
              cityAndState,
              style: AppTheme.bodyOne.copyWith(color: AppTheme.offBlack),
            ),
          ],
        ),
      );
}
