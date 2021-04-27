/// -----------------------------------------------------------------
///
/// File: algolia_query_result.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Sunday, April 25th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:algolia/algolia.dart';

class AlgoliaQueryResult {
  List<AlgoliaObjectSnapshot> data;
  int page;
  int totalPages;
  int numberOfHits;
  bool get hasMorePages => page < totalPages;
  int get nextPage => page += 1;

  AlgoliaQueryResult({
    this.data = const <AlgoliaObjectSnapshot>[],
    this.page = 0,
    this.totalPages = 0,
    this.numberOfHits = 0,
  });
}
