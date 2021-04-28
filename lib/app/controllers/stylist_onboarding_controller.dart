/// -----------------------------------------------------------------
///
/// File: stylist_onboarding_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 27th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/routes.dart';

class StylistOnboardingController extends GetxController {
  RxString currentName;
  RxString currentLocation;
  RxBool _isLicensed;
  RxString _currentLicensedState;
  Rx<UserType> _selectedUserType;
  Rx<OnboardingStep> _currentStep;
  RxList<Specialties> selectedSpecialities;

  bool get isLicensed => _isLicensed.value;
  String get currentLicensedState => _currentLicensedState.value;
  OnboardingStep get currentStep => _currentStep.value;
  UserType get selectedUserType => _selectedUserType.value;

  bool get canContinue {
    switch (currentStep) {
      case OnboardingStep.specialities:
        return selectedSpecialities.isNotEmpty;
      case OnboardingStep.basicInfo:
        return currentLocation.isNotEmpty &&
            currentName.isNotEmpty &&
            (!isLicensed || (isLicensed && currentLicensedState.isNotEmpty));

      default:
        return true;
    }
  }

  StylistOnboardingController({OnboardingStep step}) {
    _currentStep = (step ?? OnboardingStep.userTypeSelecton).obs;
  }

  @override
  void onInit() {
    currentName = ''.obs;
    currentLocation = ''.obs;
    _isLicensed = false.obs;
    _currentLicensedState = ''.obs;
    selectedSpecialities = <Specialties>[].obs;

    super.onInit();
  }

  void onChangeCurrentName(String name) {
    currentName.value = name?.trim();
  }

  void onChangeCurrentLocation(String location) {
    currentLocation.value = location?.trim();
  }

  void onChangeLicensed(bool licensed) {
    _isLicensed.value = licensed;
  }

  void onChangeCurrentState(String state) {
    _currentLicensedState.value = state?.trim();
  }

  void onPressContinue() {
    if (_currentStep.value == OnboardingStep.feeTypes) {
      Get.offAndToNamed(Routes.STYLIST_HOME);
    } else {
      canContinue
          ? _currentStep.value = OnboardingStep.values[currentStep.index + 1]
          : false;
    }
  }

  void updateStep(OnboardingStep step) {
    _currentStep.value = step;
  }

  void selectUserType(UserType type) {
    _selectedUserType = type.obs;
  }

  void onPressedBack() {
    _currentStep.value = OnboardingStep.values[currentStep.index - 1];
  }
}
