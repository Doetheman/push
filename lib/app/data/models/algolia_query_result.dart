/// -----------------------------------------------------------------
///
/// File: algolia_query_result.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Monday, March 15th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
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
