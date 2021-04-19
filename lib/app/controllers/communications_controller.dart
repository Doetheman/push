/// -----------------------------------------------------------------
///
/// File: communications_title_bar_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 18th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Last Modified: Sunday, April 18th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';

class CommunicationsController extends GetxController {
  // ConversationRepository conversationRepository = Get.put(ConversationRepository());
  // NotificationRepository notificationRepository = Get.put(NotificationRepository());

  RxBool _isOnConversationsTab;
  bool get isOnConversationsTab => _isOnConversationsTab.value;

  RxInt _unreadNotifications;
  int get unreadNotifications => _unreadNotifications.value;

  RxInt _unreadConversations;
  int get unreadConversations => _unreadConversations.value;

  bool get hasUnreadNotifications => _unreadNotifications == 0.obs;
  bool get hasUnreadConversations => _unreadConversations == 0.obs;

  @override
  void onInit() {
    _unreadConversations = 0.obs;
    _unreadNotifications = 2.obs;
    _isOnConversationsTab = true.obs;

    super.onInit();
  }

  void onPressTab(bool isConversationsTab) {
    _isOnConversationsTab.value = isConversationsTab;
  }
}
