/// -----------------------------------------------------------------
///
/// File: conversation.dart
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

import 'package:push_app/app/data/models/app_content.dart';

class Conversation extends AppContent {
  String lastMessageText;
  Map<String, bool> readBy;
  List<String> userIds;

  Conversation({
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String id,
    String createdBy,
    this.lastMessageText,
    this.userIds,
  }) : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  Conversation.fromJson(Map<String, dynamic> json)
      : lastMessageText = json['lastMessageText'],
        readBy = json['readBy'] ?? <String, bool>{},
        userIds = json['userIds'] ?? <String>[],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'userIds': userIds,

      // This allows us to query for conversations using the uids of both participants
      ...<String, dynamic>{for (String id in userIds) id: true},
    });
}
