/// -----------------------------------------------------------------
///
/// File: shop_repository.dart
/// Project: PUSH
/// File Created: Saturday, March 27th, 2021
/// Description:
///
/// Author: Dorian - dorian@Longsoftware.io
/// -----
/// Last Modified: Friday, April 9th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:push_app/app/data/models/algolia_query_result.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/shop.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/providers/algolia_provider.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/data/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_app/app/data/providers/storage_provider.dart';

class ShopRepository {
  final FirestoreProvider firestoreProvider = Get.find();
  final AuthProvider authProvider = Get.find();
  final AlgoliaProvider _algoliaProvider = Get.find();
  final StorageProvider storageProvider = Get.find();

  CollectionReference get shopCollection =>
      firestoreProvider.getCollectionReference(FirestoreCollection.SHOPS.value);

  // TODO: Add filtering
  Future<AlgoliaQueryResult> getAllShops({String query, int page}) =>
      _algoliaProvider.search(
        FirestoreCollection.SHOPS.toString(),
        query,
        page: page,
      );

  Future<Shop> add(Shop shop) async {
    shop.documentReference = await firestoreProvider.createDocument(
      shopCollection,
      shop.toJson(),
    );
    return shop;
  }

  Future<void> update(Shop shop, {bool deleteShop}) {
    shop.lastUpdatedAt = DateTime.now();
    return firestoreProvider.updateDocument(
      shop.documentReference,
      shop.toJson(),
      delete: deleteShop,
    );
  }

  void deleteImages(List<UserFile> images) {
    images.forEach((UserFile image) async {
      await storageProvider.deleteFile(image.storagePath);
    });
  }
}
