/// -----------------------------------------------------------------
///
/// File: indexer.dart
/// Project: PUSH
/// File Created: Saturday, April 24th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Saturday, April 24th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

class Indexer {
  static dynamic getListIndex(List<dynamic> list, int index) {
    if (!(list == null) && list.length > index) {
      return list[index];
    }

    return null;
  }
}
