/// -----------------------------------------------------------------
///
/// File: fee_types.dart
/// Project: PUSH
/// File Created: Thursday, April 15th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Thursday, April 15th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/misc/header_label.dart';
import 'package:push_app/app/widgets/stylist_onboarding/fee_type_card.dart';
import 'package:push_app/app/widgets/stylist_onboarding/fee_type_description.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';

class FeeTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
          Text(
            I18n.of(context).feeTypesHeaderTitle,
            style: AppTheme.subtitleOne,
          ).paddingOnly(bottom: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  I18n.of(context).feeTypesHeaderSubtitle,
                  style: AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
                ).paddingOnly(right: 20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  HeaderLabel(
                    color: AppTheme.secondaryGreen,
                    text: I18n.of(context).commonRevenue,
                    style: AppTheme.headlineFive
                        .copyWith(color: AppTheme.primaryGreen),
                    icon: SvgPicture.asset(
                      PLAIN_ACCOUNT,
                      color: AppTheme.primaryGreen,
                    ),
                  ).paddingOnly(bottom: 10),
                  HeaderLabel(
                    color: AppTheme.secondaryRed,
                    text: I18n.of(context).commonCosts,
                    style: AppTheme.headlineFive
                        .copyWith(color: AppTheme.primaryRed),
                    icon: SvgPicture.asset(
                      SHOP_ICON,
                      color: AppTheme.primaryRed,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingOnly(bottom: 50),
          ...FeeType.values
              .map(
                (FeeType type) => Row(
                  children: <Widget>[
                    Expanded(
                      child: FeeTypeDescription(
                        feeType: type,
                      ),
                    ),
                    SizedBox(width: 20),
                    FeeTypeCard(
                      feeType: type,
                    ),
                  ],
                ).paddingOnly(bottom: 50),
              )
              .toList(),
        ],
      ).paddingAll(20);
}
