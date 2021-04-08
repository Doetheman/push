/// -----------------------------------------------------------------
///
/// File: edit_notification_controller.dart
/// Project: PUSH
/// File Created: Monday, March 29th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:push_app/app/data/models/push_notification.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/repositories/notification_repository.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/utils/file_utils.dart';
import 'package:push_app/app/utils/is.dart';

class EditNotificationController extends GetxController {
  NotificationRepository notificationRepository = Get.find();

  Rx<PushNotification> _pushNotification;
  PushNotification get pushNotification => _pushNotification.value;

  // For loading indicator
  RxBool _isRequestInFlight;
  bool get isRequestInFlight => _isRequestInFlight.value;

  // list of attachments needing to be deleted from storage
  List<UserFile> _attachmentsToDelete;

  EditNotificationController({PushNotification notification}) {
    _pushNotification = (notification ?? PushNotification()).obs;
  }

  @override
  void onInit() {
    _attachmentsToDelete = <UserFile>[];
    _isRequestInFlight = false.obs;

    super.onInit();
  }

  void onChangeTitle(String title) {
    _pushNotification.value.title = title?.trim();
    _pushNotification.refresh();
  }

  void onChangeBody(String body) {
    _pushNotification.value.body = body?.trim();
    _pushNotification.refresh();
  }

  void onChangeSendAt(DateTime sendAt) {
    _pushNotification.value.sendAt = sendAt;
    _pushNotification.refresh();
  }

  void onChangeMetadata(dynamic metadata) {
    _pushNotification.value.metaData = metadata;
    _pushNotification.refresh();
  }

  void onChangeRecipents(List<NotificationRecipientsOption> recipients) {
    _pushNotification.value.recipients =
        recipients ?? <NotificationRecipientsOption>[];
    _pushNotification.refresh();
  }

  void onRemoveImage(int index) {
    if (Is.truthy(pushNotification.attachments[index]?.storagePath)) {
      _attachmentsToDelete.add(pushNotification.attachments[index]);
    }
    pushNotification.attachments.removeAt(index);
    _pushNotification.refresh();
  }

  Future<void> onSelectImage(ImageSource source) async {
    UserFile file = await FileUtils.getUserFile(source);
    if (Is.truthy(file)) {
      _pushNotification.value.attachments ??= <UserFile>[];
      _pushNotification.value.attachments.add(file);
      _pushNotification.refresh();
    }
  }

  Future<void> onPressUpdateNotification({bool delete}) async {
    _isRequestInFlight.value = true;
    await notificationRepository.update(_pushNotification.value);
    notificationRepository.deleteImages(<UserFile>[..._attachmentsToDelete]);
    _isRequestInFlight.value = false;
  }

  Future<void> onPressCreateNotification() async {
    _isRequestInFlight.value = true;
    await notificationRepository.add(_pushNotification.value);
    _isRequestInFlight.value = false;
  }
}
