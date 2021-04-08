/// -----------------------------------------------------------------
///
/// File: edit_booth_controller.dart
/// Project: PUSH
/// File Created: Wednesday, April 7th, 2021
/// Description:
///
/// Author: Luchi - oluchi@longsoftware.io
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
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/repositories/user_repository.dart';
import 'package:push_app/app/utils/file_utils.dart';
import 'package:push_app/app/utils/is.dart';

class EditBoothController extends GetxController {
  UserRepository boothRepository = Get.find();

  Rx<Booth> _booth;
  Booth get booth => _booth.value;

  // For loading indicator
  RxBool _isRequestInFlight;
  bool get isRequestInFlight => _isRequestInFlight.value;

  // list of images needing to be deleted from storage
  List<UserFile> _imagesToDelete;

  EditBoothController({Booth booth}) {
    _booth = (booth ?? Booth()).obs;
  }

  @override
  void onInit() {
    _imagesToDelete = <UserFile>[];
    _isRequestInFlight = false.obs;

    super.onInit();
  }

  void onChangeOutletsAvailable(bool outletsAvailable) {
    _booth.value.outletsAvailable = outletsAvailable;
    _booth.refresh();
  }

  void onChangePrice(int price) {
    _booth.value.price = price;
    _booth.refresh();
  }

  void onChangeHasHVAC(bool hasHVAC) {
    _booth.value.hasHVAC = hasHVAC;
    _booth.refresh();
  }

  void onChangeSpecialties(List<Specialties> specialties) {
    _booth.value.specialties = specialties ?? <Specialties>[];
    _booth.refresh();
  }

  Future<void> onSelectImage(ImageSource source) async {
    UserFile file = await FileUtils.getUserFile(source);
    if (Is.truthy(file)) {
      _booth.value.images ??= <UserFile>[];
      _booth.value.images.add(file);
      _booth.refresh();
    }
  }

  void onRemoveImage(int index) {
    if (Is.truthy(booth.images[index]?.storagePath)) {
      _imagesToDelete.add(booth.images[index]);
    }
    booth.images.removeAt(index);
    _booth.refresh();
  }
}
