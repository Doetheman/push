/// -----------------------------------------------------------------
///
/// File: is.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

class Is {
  static bool falsy(dynamic item) {
    if (emptyOrNull(item) || item == false) {
      return true;
    }
    return false;
  }

  static bool truthy(dynamic item) {
    if (!emptyOrNull(item) && item != false) {
      return true;
    }
    return false;
  }

  static bool emptyOrNull(dynamic item) {
    if (item == null) {
      return true;
    }
    if (item is String) {
      item = item.trim();
    }

    if (item is String || item is List || item is Map) {
      return item.isEmpty;
    }

    return false;
  }

  static bool validCollectionPath(String path) {
    // valid: {collectionName}/{documentId}/{colelctionName2}
    // invalid: {collectionName}/{documentId}
    if (emptyOrNull(path)) {
      return false;
    }
    final List<String> splitPath = path.split('/');
    return splitPath.length % 2 == 1 && !emptyOrNull(splitPath.last);
  }

  static bool validDocumentPath(String path) {
    // invalid: {collectionName}/{documentId}/{colelctionName2}
    // valid: {collectionName}/{documentId}
    if (emptyOrNull(path)) {
      return false;
    }
    final List<String> splitPath = path.split('/');
    return splitPath.length % 2 == 0 && !emptyOrNull(splitPath.last);
  }
}
