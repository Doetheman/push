/// -----------------------------------------------------------------
///
/// File: fee_type_card.dart
/// Project: PUSH
/// File Created: Wednesday, April 14th, 2021
/// Description:
///
/// Author: Luchi - you@you.you
/// -----
/// Last Modified: Thursday, April 15th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';

class FeeTypeCard extends StatelessWidget {
  final FeeType feeType;
  String get feeTypeSvg {
    switch (feeType) {
      case FeeType.fixed:
        return FIXED_FEE_TYPE;
      case FeeType.commission:
        return COMMISSION_FEE_TYPE;
      case FeeType.fixedAndCommission:
        return FIXED_AND_COMMISSION_FEE_TYPE;
        break;
      default:
        return '';
    }
  }

  FeeTypeCard({
    this.feeType,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 114,
        width: 128,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.offWhite,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: SvgPicture.asset(
          feeTypeSvg,
          alignment: Alignment.centerLeft,
          fit: BoxFit.cover,
        ).paddingOnly(top: 10, right: 10, bottom: 10),
      );
}
