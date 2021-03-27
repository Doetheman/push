/// -----------------------------------------------------------------
///
/// File: edit_user_controller.dart
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

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:push_app/app/data/models/app_user.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/repositories/user_repository.dart';
import 'package:push_app/app/utils/file_utils.dart';
import 'package:push_app/app/utils/is.dart';

class EditUserController extends GetxController {
  UserRepository userRepository = Get.find();

  Rx<AppUser> _user;
  AppUser get user => _user.value;

  // For loading indicator
  RxBool _isRequestInFlight;
  bool get isRequestInFlight => _isRequestInFlight.value;

  // list of images needing to be deleted from storage
  List<UserFile> _imagesToDelete;

  EditUserController({AppUser appUser}) {
    _user = (appUser ?? AppUser()).obs;
  }

  @override
  void onInit() {
    _imagesToDelete = <UserFile>[];

    super.onInit();
  }

  void onChangeFirstName(String name) {
    _user.value.firstName = name?.trim();
    _user.refresh();
  }

  void onChangeLastName(String name) {
    _user.value.lastName = name?.trim();
    _user.refresh();
  }

  void onChangeType(UserType type) {
    _user.value.type = type;
    _user.refresh();
  }

  Future<void> updateUser() async {
    _isRequestInFlight.value = true;
    await userRepository.update(_user.value);
    userRepository.deleteImages(<UserFile>[..._imagesToDelete]);
    _imagesToDelete = <UserFile>[];
    _isRequestInFlight.value = false;
  }

  void onRemoveProfileImage() {
    if (Is.truthy(user.profileImage?.storagePath)) {
      _imagesToDelete.add(user.profileImage);
    }
    _user.value.profileImage = null;
    _user.refresh();
  }

  void onRemoveImage(int index) {
    if (Is.truthy(user.images[index]?.storagePath)) {
      _imagesToDelete.add(user.images[index]);
    }
    user.images.removeAt(index);
    _user.refresh();
  }

  Future<void> onSelectImage(ImageSource source) async {
    UserFile file = await FileUtils.getUserFile(source);
    if (Is.truthy(file)) {
      _user.value.images ??= <UserFile>[];
      _user.value.images.add(file);
      _user.refresh();
    }
  }

  Future<void> onSelectProfileImage(ImageSource source) async {
    UserFile file = await FileUtils.getUserFile(source);
    if (Is.truthy(file)) {
      onRemoveProfileImage();
      _user.value.profileImage = file;
      _user.refresh();
    }
  }
}
