/// -----------------------------------------------------------------
///
/// File: push_notification.dart
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

import 'package:enum_to_string/enum_to_string.dart';
import 'package:push_app/app/data/models/app_content.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/utils/is.dart';

class PushNotification extends AppContent {
  List<UserFile> attachments;
  dynamic metaData;
  String title;
  String body;
  DateTime sendAt;
  List<NotificationRecipientsOption> recipients;

  PushNotification({
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String id,
    String createdBy,
    this.metaData,
    this.attachments,
    this.title,
    this.body,
  }) : super(
            createdAt: createdAt,
            lastUpdatedAt: lastUpdatedAt,
            id: id,
            createdBy: createdBy);

  PushNotification.fromJson(Map<String, dynamic> json)
      : attachments = json['attachments'] != null
            ? List<UserFile>.from(json['attachments']
                .map((dynamic attachment) => UserFile.fromJson(attachment)))
            : <UserFile>[],
        metaData = json['metaData'],
        title = json['title'],
        body = json['body'],
        sendAt = json['sendAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['sendAt']),
        recipients = Is.truthy(json['recipients'])
            ? List<NotificationRecipientsOption>.from(
                json['recipients'].map(
                  (dynamic recipient) => EnumToString.fromString(
                    NotificationRecipientsOption.values,
                    recipient,
                  ),
                ),
              )
            : null,
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'attachments': attachments
          ?.map((UserFile attachment) => attachment.toJson())
          ?.toList(),
      'metaData': metaData,
      'title': title,
      'body': body,
      'sendAt': sendAt?.millisecondsSinceEpoch,
      'recipients': recipients
          ?.map((NotificationRecipientsOption recipient) =>
              EnumToString.convertToString(recipient))
          ?.toList(),
    });
}
