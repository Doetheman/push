/// -----------------------------------------------------------------
///
/// File: firestore_provider.dart
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/utils/is.dart';

class FirestoreProvider {
  dynamic firestore;

  FirestoreProvider(this.firestore);

  Query buildQuery({
    CollectionReference collection,
    Query startingQuery,
    String key,
    FirestoreQueryOperator<dynamic> queryOperator,
    dynamic value,
    int limit,
    String orderBy,
    bool descending = false,
    dynamic startAt,
    dynamic startAfter,
    dynamic endAt,
    dynamic endBefore,
    DocumentSnapshot startAtDocument,
    DocumentSnapshot startAfterDocument,
    DocumentSnapshot endAtDocument,
    DocumentSnapshot endBeforeDocument,
  }) {
    assert(!Is.emptyOrNull(collection) || !Is.emptyOrNull(startingQuery));

    bool usingCollection = Is.emptyOrNull(startingQuery);

    Query query;

    switch (queryOperator) {
      case FirestoreQueryOperator.IS_EQUAL_TO:
        query = (usingCollection ? collection : startingQuery)
            .where(key, isEqualTo: value);
        break;
      case FirestoreQueryOperator.IS_GREATER_THAN:
        query = (usingCollection ? collection : startingQuery)
            .where(key, isGreaterThan: value);
        break;
      case FirestoreQueryOperator.IS_GREATER_THAN_OR_EQUAL_TO:
        query = (usingCollection ? collection : startingQuery)
            .where(key, isGreaterThanOrEqualTo: value);
        break;
      case FirestoreQueryOperator.IS_LESS_THAN:
        query = (usingCollection ? collection : startingQuery)
            .where(key, isLessThan: value);
        break;
      case FirestoreQueryOperator.IS_LESS_THAN_OR_EQUAL_TO:
        query = (usingCollection ? collection : startingQuery)
            .where(key, isLessThanOrEqualTo: value);
        break;
      case FirestoreQueryOperator.ARRAY_CONTAINS:
        query = (usingCollection ? collection : startingQuery)
            .where(key, arrayContains: value);
        break;
      case FirestoreQueryOperator.ARRAY_CONTAINS_ANY:
        query = (usingCollection ? collection : startingQuery)
            .where(key, arrayContainsAny: value);
        break;
      case FirestoreQueryOperator.IS_NULL:
        query = (usingCollection ? collection : startingQuery)
            .where(key, isNull: value);
        break;
      case FirestoreQueryOperator.WHERE_IN:
        query = (usingCollection ? collection : startingQuery)
            .where(key, whereIn: value);
        break;
      default:
        query = usingCollection ? null : startingQuery;
    }
    if (!Is.emptyOrNull(limit) && limit > 0) {
      query =
          Is.emptyOrNull(query) ? collection.limit(limit) : query.limit(limit);
    }
    if (!Is.emptyOrNull(orderBy)) {
      query = Is.emptyOrNull(query)
          ? collection.orderBy(orderBy, descending: descending)
          : query.orderBy(orderBy, descending: descending);

      // queries that require orderBy
      if (!Is.emptyOrNull(startAfter)) {
        query = query.startAfter(startAfter);
      } else if (!Is.emptyOrNull(startAt)) {
        query = query.startAt(startAt);
      } else if (!Is.emptyOrNull(startAtDocument)) {
        query = query.startAtDocument(startAtDocument);
      } else if (!Is.emptyOrNull(startAfterDocument)) {
        query = query.startAfterDocument(startAfterDocument);
      }
      if (!Is.emptyOrNull(endBefore)) {
        query = query.endBefore(endBefore);
      } else if (!Is.emptyOrNull(endAt)) {
        query = query.endAt(endAt);
      } else if (!Is.emptyOrNull(endBeforeDocument)) {
        query = query.endBeforeDocument(endBeforeDocument);
      } else if (!Is.emptyOrNull(endAtDocument)) {
        query = query.endAtDocument(endAtDocument);
      }
    }

    return !Is.emptyOrNull(query) ? query : collection;
  }

  Future<QuerySnapshot> queryCollection({
    CollectionReference collection,
    Query startingQuery,
    String key,
    FirestoreQueryOperator<dynamic> queryOperator,
    dynamic value,
    int limit,
    String orderBy,
    bool descending = false,
    dynamic startAt,
    dynamic startAfter,
    dynamic endAt,
    dynamic endBefore,
    DocumentSnapshot startAtDocument,
    DocumentSnapshot startAfterDocument,
    DocumentSnapshot endAtDocument,
    DocumentSnapshot endBeforeDocument,
  }) {
    assert(!Is.emptyOrNull(collection) || !Is.emptyOrNull(startingQuery));

    return buildQuery(
      collection: collection,
      startingQuery: startingQuery,
      key: key,
      value: value,
      queryOperator: queryOperator,
      limit: limit,
      orderBy: orderBy,
      descending: descending,
      startAt: startAt,
      startAfter: startAfter,
      endAt: endAt,
      endBefore: endBefore,
      startAtDocument: startAtDocument,
      startAfterDocument: startAfterDocument,
      endAtDocument: endAtDocument,
      endBeforeDocument: endBeforeDocument,
    ).get();
  }

  Future<DocumentSnapshot> getDocumentSnapshot(
    CollectionReference collection,
    String documentId,
  ) async {
    assert(!Is.emptyOrNull(documentId));
    assert(!Is.emptyOrNull(collection));
    return collection.doc(documentId).get();
  }

  /// Expects a `/` delemeted path to the collection a reference is desired.
  ///
  /// Ex:  `users/[uid]/clients`
  ///
  CollectionReference getCollectionReference(String collectionPath) {
    assert(Is.validCollectionPath(collectionPath));
    return firestore.collection(collectionPath);
  }

  /// Expects a `/` delemeted path to the document a reference is desired.
  ///
  /// Ex:  `users/[uid]/clients/[client_uid]`
  ///
  DocumentReference getDocumentReference(String documentPath) {
    assert(Is.validDocumentPath(documentPath));
    return firestore.doc(documentPath);
  }

  Future<DocumentReference> createDocument(
      CollectionReference collection, Map<String, dynamic> documentData,
      {String documentId}) async {
    assert(!Is.emptyOrNull(collection));
    assert(!Is.emptyOrNull(documentData));
    DocumentReference document = collection.doc(documentId);
    if (Is.emptyOrNull(documentId)) {
      documentData['id'] = document.id;
    }
    await document.set(documentData);
    return document;
  }

  Future<dynamic> batchWriteSet(
    CollectionReference collection,
    dynamic writeBatch,
    Map<String, dynamic> documentData, {
    String documentId,
  }) async {
    assert(!Is.emptyOrNull(collection));
    assert(!Is.emptyOrNull(documentData));
    DocumentReference document = collection.doc(documentId);
    if (Is.emptyOrNull(documentId)) {
      documentData['id'] = documentId;
    }
    writeBatch.set(document, documentData);
    return writeBatch;
  }

  Future<void> updateDocument(
      DocumentReference document, Map<String, dynamic> documentData,
      {bool delete = false, Map<String, dynamic> originalDocumentData}) {
    assert(!Is.emptyOrNull(document));
    if (delete) {
      return document.delete();
    } else {
      assert(!Is.emptyOrNull(documentData));

      /// In the event that the original document's data is provided, we should
      /// ignore all data that was not manipulated. This is to prevent overwriting
      /// data that is typically only modified by the backend
      if (Is.truthy(originalDocumentData)) {
        documentData.removeWhere(
          (String key, dynamic value) =>
              originalDocumentData.containsKey(key) &&
              originalDocumentData[key] == value,
        );
      }
      return document.update(documentData);
    }
  }

  /// Expects a `/` delemeted path to the collection a reference is desired.
  ///
  /// Ex:  `users/[uid]/clients`
  ///
  Query getCollectionGroup(String collectionPath) {
    assert(Is.validCollectionPath(collectionPath));
    return firestore.collectionGroup(collectionPath);
  }

  dynamic queryCollectionSnapshots({
    CollectionReference collection,
    Query startingQuery,
    String key,
    FirestoreQueryOperator<dynamic> queryOperator,
    dynamic value,
    int limit,
    String orderBy,
    bool descending = false,
    dynamic startAt,
    dynamic startAfter,
    dynamic endAt,
    dynamic endBefore,
    DocumentSnapshot startAtDocument,
    DocumentSnapshot startAfterDocument,
    DocumentSnapshot endAtDocument,
    DocumentSnapshot endBeforeDocument,
  }) {
    assert(!Is.emptyOrNull(collection) || !Is.emptyOrNull(startingQuery));

    return buildQuery(
      collection: collection,
      startingQuery: startingQuery,
      key: key,
      value: value,
      queryOperator: queryOperator,
      limit: limit,
      orderBy: orderBy,
      descending: descending,
      startAt: startAt,
      startAfter: startAfter,
      endAt: endAt,
      endBefore: endBefore,
      startAtDocument: startAtDocument,
      startAfterDocument: startAfterDocument,
      endAtDocument: endAtDocument,
      endBeforeDocument: endBeforeDocument,
    ).snapshots();
  }

  Future<dynamic> incrementCounter({
    DocumentReference documentReference,
    String counterKey,
  }) =>
      firestore.runTransaction((dynamic transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        if (!snapshot.exists) {
          throw Exception('Document does not exist!');
        }

        int newCount = snapshot.data()[counterKey] + 1;

        transaction
            .update(documentReference, <String, dynamic>{counterKey: newCount});

        return newCount;
      });
}
