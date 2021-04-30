/// -----------------------------------------------------------------
/// 
/// File: date_time_utils.dart
/// Project: PUSH
/// File Created: Wednesday, April 28th, 2021
/// Description: 
/// 
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 28th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
/// 
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
/// 
/// -----------------------------------------------------------------

import 'package:push_app/app/utils/is.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getHour(DateTime time) {
    if (Is.falsy(time)) {
      return '';
    }

    if (time.hour == 12) {
      return 'Noon';
    }

    return DateFormat('ha').format(time);
  }
}
