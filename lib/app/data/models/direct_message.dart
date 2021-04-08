/// -----------------------------------------------------------------
///
/// File: direct_message.dart
/// Project: PUSH
/// File Created: Thursday, March 18th, 2021
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

import 'package:push_app/app/data/models/app_content.dart';
import 'package:push_app/app/data/models/user_file.dart';

class DirectMessage extends AppContent {
  String text;
  UserFile attachment;

  DirectMessage({
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String id,
    String createdBy,
    this.text,
    this.attachment,
  }) : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  DirectMessage.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        attachment = json['attachment'] == null
            ? null
            : UserFile.fromJson(json['attachment']),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'text': text,
      'attachment': attachment?.toJson(),
    });
}
