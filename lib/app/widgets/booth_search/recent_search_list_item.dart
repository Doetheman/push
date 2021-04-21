/// -----------------------------------------------------------------
///
/// File: recent_search_list_item.dart
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
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_app/app/data/models/booth_search.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';

class RecentSearchListItem extends StatelessWidget {
  final BoothSearch boothSearch;

  RecentSearchListItem({
    this.boothSearch,
  });

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.offWhite,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                ),
              ],
            ),
            child: SvgPicture.asset(
              CLOCK_ICON,
            ).paddingAll(10),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  boothSearch.location,
                  style: AppTheme.bodyOne,
                ),
                Text(
                  boothSearch.minDaysFromNow == 1
                      ? I18n.of(context).rencentSearchListItemOneDayRange(
                          boothSearch.minimumHoursAvailable.toString(),
                          boothSearch.maxHoursAvailable.toString())
                      : I18n.of(context).rencentSearchListItemMultiDayRange(
                          boothSearch.minimumHoursAvailable.toString(),
                          boothSearch.maxHoursAvailable.toString(),
                          boothSearch.minDaysFromNow.toString()),
                  style: AppTheme.bodyTwo.copyWith(
                      fontWeight: FontWeight.w400, color: AppTheme.darkGrey),
                ),
              ],
            ),
          ),
        ],
      );
}
