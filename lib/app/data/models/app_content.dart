/// -----------------------------------------------------------------
///
/// File: app_content.dart
/// Project: PUSH
/// File Created: Thursday, March 18th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Thursday, March 18th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';

class AppContent {
  AuthProvider authProvider = Get.find();

  DateTime createdAt;
  String id;
  String createdBy;
  DateTime lastUpdatedAt;
  DocumentReference documentReference;

  AppContent({
    this.createdAt,
    this.id,
    this.createdBy,
    this.lastUpdatedAt,
  }) {
    createdAt ??= DateTime.now();
    lastUpdatedAt ??= DateTime.now();
    createdBy ??= authProvider.currentUid;
  }
  AppContent.fromJson(
    Map<String, dynamic> jsonData, {
    DocumentReference reference,
  })  : createdAt = jsonData['createdAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(jsonData['createdAt']),
        id = jsonData['id'],
        createdBy = jsonData['createdBy'],
        lastUpdatedAt = jsonData['lastUpdatedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(jsonData['lastUpdatedAt']),
        documentReference = reference;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'id': id,
        'createdBy': createdBy,
        'lastUpdatedAt': lastUpdatedAt?.millisecondsSinceEpoch,
      };
}
