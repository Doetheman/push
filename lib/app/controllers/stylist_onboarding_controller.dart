/// -----------------------------------------------------------------
///
/// File: stylist_onboarding_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 20th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:get/get.dart';

class StylistOnboardingController extends GetxController {
  RxString currentName;
  RxString currentLocation;
  RxBool _isLicensed;
  RxString _currentLicensedState;

  bool get isLicensed => _isLicensed.value;
  String get currentLicensedState => _currentLicensedState.value;

  @override
  void onInit() {
    currentName = ''.obs;
    currentLocation = ''.obs;
    _isLicensed = false.obs;
    _currentLicensedState = ''.obs;
    super.onInit();
  }

  void onChangeCurrentName(String name) {
    currentName.value = name?.trim();
  }

  void onChangeCurrentLocation(String location) {
    currentLocation.value = location?.trim();
  }

  void onChangeLicensed(bool licensed) {
    if (licensed == true) {
      _isLicensed.value = true;
    } else {
      _isLicensed.value = false;
    }
  }

  void onChangeCurrentState(String state) {
    _currentLicensedState.value = state?.trim();
  }
}
