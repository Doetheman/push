/// -----------------------------------------------------------------
///
/// File: edit_shop_controller.dart
/// Project: PUSH
/// File Created: Saturday, March 27th, 2021
/// Description:
///
/// Author: Dorian - you@you.you
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:push_app/app/data/models/shop.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/repositories/shop_repository.dart';
import 'package:push_app/app/utils/file_utils.dart';
import 'package:push_app/app/utils/is.dart';

class EditShopController extends GetxController {
  ShopRepository shopRepository = Get.find();

  Rx<Shop> _shop;
  Shop get shop => _shop.value;

  // For loading indicator
  RxBool _isRequestInFlight;
  bool get isRequestInFlight => _isRequestInFlight.value;

  // list of attachments needing to be deleted from storage
  List<UserFile> _imagesToDelete;

  EditShopController({Shop shopToEdit}) {
    _shop = (shopToEdit ?? Shop()).obs;
  }

  @override
  void onInit() {
    _imagesToDelete = <UserFile>[];
    _isRequestInFlight = false.obs;

    super.onInit();
  }

  void onChangeName(String name) {
    _shop.value.name = name?.trim();
    _shop.refresh();
  }

  void onChangeAddress(String address) {
    _shop.value.address = address?.trim();
    _shop.refresh();
  }

  void onChangeHours(List<HoursOfOperation> hoursOfOperation) {
    _shop.value.hoursOfOperation = hoursOfOperation ?? <HoursOfOperation>[];
    _shop.refresh();
  }

  void onChangeWebsite(String website) {
    _shop.value.website = website?.trim();
    _shop.refresh();
  }

  void onChangeVerified() {
    _shop.value.verified = _shop.value.verified ? false : true;
  }

  Future<void> onSelectImage(ImageSource source) async {
    UserFile file = await FileUtils.getUserFile(source);
    if (Is.truthy(file)) {
      _shop.value.images ??= <UserFile>[];
      _shop.value.images.add(file);
      _shop.refresh();
    }
  }

  void onRemoveImage(int index) {
    if (Is.truthy(shop.images[index]?.storagePath)) {
      _imagesToDelete.add(shop.images[index]);
    }
    shop.images.removeAt(index);
    _shop.refresh();
  }

  Future<void> onPressUpdateShop({bool delete}) async {
    _isRequestInFlight.value = true;
    await shopRepository.update(_shop.value, deleteShop: delete);
    shopRepository.deleteImages(<UserFile>[..._imagesToDelete]);
    _isRequestInFlight.value = false;
  }

  Future<void> onPressCreateShop() async {
    _isRequestInFlight.value = true;
    await shopRepository.add(_shop.value);
    _isRequestInFlight.value = false;
  }
}
