/// -----------------------------------------------------------------
///
/// File: fee_type_description.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 13th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/generated/i18n.dart';

class FeeTypeDescription extends StatelessWidget {
  final FeeType feeType;

  bool get isFixed => feeType == FeeType.fixed;
  bool get isCommission => feeType == FeeType.commission;
  bool get isFixedAndCommission => feeType == FeeType.fixedAndCommission;

  FeeTypeDescription({
    this.feeType,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            (isFixed
                    ? I18n.of(context).feeTypesFixed
                    : isCommission
                        ? I18n.of(context).feeTypesCommission
                        : isFixedAndCommission
                            ? I18n.of(context).feeTypesFixedAndCommission
                            : null)
                .toUpperCase(),
            style: AppTheme.headlineFour.copyWith(color: AppTheme.offBlack),
          ),
          Text(
            (isFixed
                ? I18n.of(context).feeTypesDescriptionFixedBody
                : isCommission
                    ? I18n.of(context).feeTypesDescriptionCommissionBody
                    : isFixedAndCommission
                        ? I18n.of(context)
                            .feeTypesDescriptionFixedAndCommissionBody
                        : null),
            style: AppTheme.bodyOne.copyWith(color: AppTheme.offBlack),
          ).paddingSymmetric(vertical: 5),
          Text(
            (isFixed
                ? I18n.of(context).feeTypesDescriptionFixedExample
                : isCommission
                    ? I18n.of(context).feeTypesDescriptionCommissionExample
                    : isFixedAndCommission
                        ? I18n.of(context)
                            .feeTypesDescriptionFixedAndCommissionExample
                        : null),
            style: AppTheme.bodyTwo.copyWith(
                fontWeight: FontWeight.w400, color: AppTheme.primaryBlue),
          ),
        ],
      );
}
