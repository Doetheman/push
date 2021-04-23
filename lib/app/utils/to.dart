/// -----------------------------------------------------------------
///
/// File: to.dart
/// Project: PUSH
/// File Created: Friday, April 23rd, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Friday, April 23rd, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/generated/i18n.dart';

class To {
  static String feeTypeString(FeeType type, BuildContext context) {
    switch (type) {
      case FeeType.commission:
        return I18n.of(context).feeTypesCommission;
      case FeeType.fixed:
        return I18n.of(context).feeTypesFixed;
      case FeeType.fixedAndCommission:
        return I18n.of(context).feeTypesFixedAndCommission;
    }

    return '';
  }
}
