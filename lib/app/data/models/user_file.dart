/// -----------------------------------------------------------------
///
/// File: user_file.dart
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
import 'package:enum_to_string/enum_to_string.dart';
import 'package:push_app/app/data/models/app_content.dart';
import 'package:push_app/app/data/models/enums.dart';

class UserFile extends AppContent {
  String altText;
  String name;
  String storagePath;
  dynamic data;
  bool hasBeenDeleted;
  String downloadUrl;
  UserFileType type;

  UserFile(
      {DateTime createdAt,
      DateTime lastUpdatedAt,
      String id,
      String createdBy,
      DocumentSnapshot documentSnapshot,
      this.altText,
      this.name,
      this.storagePath,
      this.data,
      this.hasBeenDeleted,
      this.downloadUrl,
      this.type})
      : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  UserFile.fromJson(Map<String, dynamic> json)
      : altText = json['altText'],
        name = json['name'],
        storagePath = json['storagePath'],
        hasBeenDeleted = json['hasBeenDeleted'],
        downloadUrl = json['downloadUrl'],
        type = EnumToString.fromString(UserFileType.values, json['type']),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'altText': altText,
      'name': name,
      'storagePath': storagePath,
      'hasBeenDeleted': hasBeenDeleted,
      'downloadUrl': downloadUrl,
      'type': EnumToString.convertToString(type),
    });
}
