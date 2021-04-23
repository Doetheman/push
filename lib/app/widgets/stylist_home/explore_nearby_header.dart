/// -----------------------------------------------------------------
///
/// File: explore_nearby_header.dart
/// Project: PUSH
/// File Created: Thursday, April 22nd, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Friday, April 23rd, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/home_controller.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/utils/to.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';

class ExploreNearbyHeader extends StatelessWidget {
  final HomeController controller = Get.find();

  String getAvailabiltyTypeText(BuildContext context) {
    if (controller.isToday) {
      return EnumToString.convertToString(ReservationAvailabilityType.today);
    } else if (controller.isTomorrow) {
      return EnumToString.convertToString(ReservationAvailabilityType.tomorrow);
    } else {
      return I18n.of(context).exploreNearbyAnyTimeNextWeek;
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  I18n.of(context).exploreNearbyTitle,
                  style: AppTheme.headlineOne,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(FILTER_ICON),
                ),
              ],
            ),
          ).paddingOnly(bottom: 7),
          Container(
            width: Get.width,
            child: Obx(
              () => Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: I18n.of(context).exploreNearbyBody,
                      style:
                          AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
                    ),
                    TextSpan(
                      text: I18n.of(context).exploreNearbyAvailability(
                        getAvailabiltyTypeText(context),
                      ),
                      style: AppTheme.bodyOne
                          .copyWith(color: AppTheme.primaryBlue),
                    ),
                    TextSpan(
                      text: I18n.of(context).exploreNearbyFor,
                      style:
                          AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
                    ),
                    TextSpan(
                      text: I18n.of(context).exploreNearbyMinMaxHours(
                        controller.exploreNearbyMinHoursAvailable.value
                            .toString(),
                        controller.exploreNearbyMaxHoursAvailable.value
                            .toString(),
                      ),
                      style: AppTheme.bodyOne
                          .copyWith(color: AppTheme.primaryBlue),
                    ),
                    TextSpan(
                      text: I18n.of(context).exploreNearbyWith,
                      style:
                          AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
                    ),
                    if (controller.showOneFeeType)
                      TextSpan(
                        text: To.feeTypeString(
                            controller.currentFeeTypes[0], context),
                        style: AppTheme.bodyOne
                            .copyWith(color: AppTheme.primaryBlue),
                      ),
                    if (controller.showAllFeeTypes)
                      TextSpan(
                        text: I18n.of(context).exploreNearbyAny,
                        style: AppTheme.bodyOne
                            .copyWith(color: AppTheme.primaryBlue),
                      ),
                    if (controller.showTwoFeeTypes)
                      TextSpan(
                        text: To.feeTypeString(
                            controller.currentFeeTypes[0], context),
                        style: AppTheme.bodyOne
                            .copyWith(color: AppTheme.primaryBlue),
                      ),
                    if (controller.showTwoFeeTypes)
                      TextSpan(
                        text: I18n.of(context).commonAnd,
                        style:
                            AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
                      ),
                    if (controller.showTwoFeeTypes)
                      TextSpan(
                        text: To.feeTypeString(
                            controller.currentFeeTypes[1], context),
                        style: AppTheme.bodyOne
                            .copyWith(color: AppTheme.primaryBlue),
                      ),
                    TextSpan(
                      text: I18n.of(context).exploreNearbyFeeType,
                      style:
                          AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
                    ),
                  ],
                ),
              ),
            ),
          ).paddingOnly(right: Get.width * 0.2),
        ],
      );
}
