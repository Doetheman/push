/// -----------------------------------------------------------------
///
/// File: booth_repository.dart
/// Project: PUSH
/// File Created: Wednesday, March 24th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Thursday, April 15th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:push_app/app/data/models/algolia_query_result.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/providers/algolia_provider.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/data/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoothRepository {
  final FirestoreProvider firestoreProvider = Get.find();
  final AuthProvider authProvider = Get.find();
  final AlgoliaProvider _algoliaProvider = Get.find();

  CollectionReference get boothsCollection => firestoreProvider
      .getCollectionReference(FirestoreCollection.BOOTHS.value);

  // TODO: Add filtering
  Future<AlgoliaQueryResult> getAllBooths({String query, int page}) =>
    _algoliaProvider.search(
      FirestoreCollection.BOOTHS.toString(),
      query,
      page: page,
    );

  Future<Booth> add(Booth booth) async {
    booth.documentReference = await firestoreProvider.createDocument(
      boothsCollection,
      booth.toJson(),
    );
    return booth;
  }

  Future<void> update(Booth booth, {bool deleteBooth}) {
    booth.lastUpdatedAt = DateTime.now();
    return firestoreProvider.updateDocument(
      booth.documentReference,
      booth.toJson(),
      delete: deleteBooth,
    );
  }
}
