/// -----------------------------------------------------------------
///
/// File: booth_search_input.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';
import 'package:push_app/app/data/models/booth_search.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/booth_search/current_location.dart';
import 'package:push_app/app/widgets/booth_search/location_list_item.dart';
import 'package:push_app/app/widgets/booth_search/recent_search_list_item.dart';
import 'package:push_app/app/widgets/booth_search/search_bar.dart';
import 'package:push_app/generated/i18n.dart';

class BoothSearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoothSearchController controller = Get.find();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBar(),
          if (controller.searchText.isEmpty)
            Text(I18n.of(context).boothSearchInputRecentSearches,
                    style: AppTheme.subtitleTwo)
                .paddingSymmetric(vertical: 15),
          if (controller.searchText.isEmpty)
            ...controller.recentSearches.map(
              (BoothSearch booth) => RecentSearchListItem(boothSearch: booth)
                  .paddingOnly(bottom: 15),
            ),
          if (controller.searchText.isEmpty)
            Text(
              I18n.of(context).boothSearchInputAreasNearYou,
              style: AppTheme.subtitleTwo,
              textAlign: TextAlign.left,
            ).paddingOnly(bottom: 15),
          if (controller.searchText.isNotEmpty)
            Text(I18n.of(context).boothSearchInputLocations,
                    style: AppTheme.subtitleTwo)
                .paddingSymmetric(vertical: 15),
          CurrentLocation().paddingOnly(bottom: 15),
          if (controller.searchText.isEmpty)
            ...controller.areasNear.map(
              (String city) =>
                  LocationListItem(cityAndState: city).paddingOnly(bottom: 15),
            ),
          if (controller.searchText.isNotEmpty)
            ...controller.areasNear.map(
              (String city) =>
                  LocationListItem(cityAndState: city).paddingOnly(bottom: 15),
            ),
        ],
      ),
    );
  }
}
