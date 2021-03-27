/// -----------------------------------------------------------------
///
/// File: file_utils.dart
/// Project: PUSH
/// File Created: Saturday, March 27th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Saturday, March 27th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/utils/is.dart';

class FileUtils {
  static Future<UserFile> getUserFile(
    ImageSource source, {
    String uid,
  }) async {
    if (!await Permission.camera.request().isGranted) return null;

    PickedFile pickedFile = await ImagePicker().getImage(
      source: source,
      imageQuality: 50,
      maxWidth: 600,
      maxHeight: 600,
    );

    if (Is.emptyOrNull(pickedFile)) return null;

    DateTime now = DateTime.now();

    return UserFile(
      data: pickedFile,
      createdBy: uid,
      createdAt: now,
      lastUpdatedAt: now,
      type: UserFileType.image,
      hasBeenDeleted: false,
    );
  }
}
