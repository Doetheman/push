/// -----------------------------------------------------------------
///
/// File: notification_repository.dart
/// Project: PUSH
/// File Created: Friday, March 19th, 2021
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
import 'package:enum_to_string/enum_to_string.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/push_notification.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/data/providers/firestore_provider.dart';
import 'package:push_app/app/data/providers/storage_provider.dart';
import 'package:push_app/app/utils/is.dart';

class NotificationRepository {
  final FirestoreProvider firestoreProvider = Get.find();
  final AuthProvider authProvider = Get.find();
  final StorageProvider storageProvider = Get.find();

  CollectionReference get notificationCollection => firestoreProvider
      .getCollectionReference(FirestoreCollection.NOTIFICATIONS.value);

  void deleteImages(List<UserFile> images) {
    images.forEach((UserFile image) async {
      await storageProvider.deleteFile(image.storagePath);
    });
  }

  Future<UserFile> uploadImage(
      UserFile file, PushNotification notification) async {
    DateTime now = DateTime.now();

    String fileName =
        'user_notification_image_${now.microsecondsSinceEpoch}.jpg';
    String storagePath = FirestoreCollection.NOTIFICATIONS.value +
        '/' +
        notification.id +
        '/$fileName';

    String url = await storageProvider.uploadFile(
      storagePath,
      await file.data.readAsBytes(),
    );

    file.downloadUrl = url;
    file.storagePath = storagePath;
    file.name = 'Notification Image';
    file.altText = 'Notification Image';

    file.data = null;

    return file;
  }

  Future<PushNotification> uploadImages(PushNotification notification) async {
    if (Is.truthy(notification.attachments)) {
      for (int i = 0; i < notification.attachments.length; i++) {
        if (Is.truthy(notification.attachments[i].data)) {
          notification.attachments[i] =
              await uploadImage(notification.attachments[i], notification);
        }
      }
    }
    return notification;
  }

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

  Future<void> add(PushNotification pushNotification) async {
    pushNotification.documentReference = await firestoreProvider.createDocument(
      notificationCollection,
      pushNotification.toJson(),
    );

    pushNotification.id = pushNotification.documentReference.id;

    // Update to store images
    return update(pushNotification);
  }

  Future<void> update(PushNotification pushNotification) async {
    pushNotification.lastUpdatedAt = DateTime.now();

    pushNotification = await uploadImages(pushNotification);

    return firestoreProvider.updateDocument(
      pushNotification.documentReference,
      pushNotification.toJson(),
    );
  }
}
