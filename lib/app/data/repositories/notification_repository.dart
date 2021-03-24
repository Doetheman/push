/// -----------------------------------------------------------------
///
/// File: notification_repository.dart
/// Project: PUSH
/// File Created: Friday, March 19th, 2021
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/push_notification.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/data/providers/firestore_provider.dart';

class NotificationRepository {
  final FirestoreProvider firestoreProvider = Get.find();
  final AuthProvider authProvider = Get.find();

  CollectionReference get notificationCollection => firestoreProvider
      .getCollectionReference(FirestoreCollection.NOTIFICATIONS.value);

  Future<List<PushNotification>> getAll({PushNotification lastNotification}) =>
      firestoreProvider
          .queryCollection(
            collection: notificationCollection,
            orderBy: 'createdAt',
            descending: true,
            key: 'recipients',
            value: <String>[
              authProvider.currentUid,
              EnumToString.convertToString(NotificationRecipientsOption.all),
              // TODO: Add user type enum for current user's type
            ],
            queryOperator: FirestoreQueryOperator.ARRAY_CONTAINS_ANY,
            limit: 20,
            startAfterDocument: lastNotification.documentSnapshot,
          )
          .then(
            (QuerySnapshot querySnapshot) =>
                querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
              PushNotification pushNotification =
                  PushNotification.fromJson(documentSnapshot.data());
              pushNotification.documentSnapshot = documentSnapshot;
              pushNotification.documentReference = documentSnapshot.reference;
              return pushNotification;
            }).toList(),
          );

  Future<void> add(PushNotification pushNotification) =>
      firestoreProvider.createDocument(
        notificationCollection,
        pushNotification.toJson(),
      );

  Future<void> update(PushNotification pushNotification) {
    pushNotification.lastUpdatedAt = DateTime.now();

    return firestoreProvider.updateDocument(
      pushNotification.documentReference,
      pushNotification.toJson(),
    );
  }
}
