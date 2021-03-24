/// -----------------------------------------------------------------
///
/// File: algolia_provider.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, March 24th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:algolia/algolia.dart';
import 'package:push_app/app/data/models/algolia_query_result.dart';
import 'package:push_app/app/utils/is.dart';

abstract class BaseAlgoliaProvider {
  Future<AlgoliaQueryResult> search(
    String index,
    String query, {
    int page = 0,
  });
}

class AlgoliaProvider implements BaseAlgoliaProvider {
  Algolia algolia;
  final String appId;
  final String apiKey;

  AlgoliaProvider(this.appId, this.apiKey)
      : algolia = Algolia.init(
          applicationId: appId,
          apiKey: apiKey,
        );

  @override
  Future<AlgoliaQueryResult> search(
    String index,
    String query, {
    int page = 0,
    List<String> facetFilters,
    List<String> numericFilters,
  }) async {
    AlgoliaQuery algoliaQuery = algolia.index(index).query(query).setPage(page);

    if (Is.truthy(facetFilters)) {
      algoliaQuery = algoliaQuery.facetFilter(facetFilters);
    }
    if (Is.truthy(numericFilters)) {
      numericFilters.forEach((String filter) {
        algoliaQuery = algoliaQuery.setNumericFilter(filter);
      });
    }

    AlgoliaQuerySnapshot snapshot = await algoliaQuery.getObjects();

    if (snapshot.empty) {
      return AlgoliaQueryResult();
    }

    return AlgoliaQueryResult(
      data: snapshot.hits,
      page: snapshot.page,
      totalPages: snapshot.nbPages,
      numberOfHits: snapshot.nbHits,
    );
  }
}
