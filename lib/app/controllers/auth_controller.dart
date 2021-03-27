/// -----------------------------------------------------------------
///
/// File: auth_controller.dart
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
import 'package:push_app/app/controllers/user_controller.dart';
import 'package:push_app/app/data/models/app_user.dart';
import 'package:push_app/app/data/repositories/user_repository.dart';
import 'package:push_app/app/utils/is.dart';

class AuthController extends GetxController {
  UserRepository userRepository = Get.find();

  RxString email;
  RxString password;
  RxString confirmPassword;

  RxBool _isSigningUp;
  bool get isSigningUp => _isSigningUp.value;

  RxBool _isRequestInFlight;
  bool get isRequestInFlight => _isRequestInFlight.value;

  bool get formIncomplete =>
      email.isBlank ||
      password.isBlank ||
      (isSigningUp && confirmPassword.isBlank);

  @override
  void onInit() {
    email = ''.obs;
    password = ''.obs;
    confirmPassword = ''.obs;

    checkForAuthenticatedUser();

    super.onInit();
  }

  void checkForAuthenticatedUser() async {
    _isRequestInFlight = (userRepository.isLoggedIn).obs;
    if (_isRequestInFlight.value) {
      AppUser user = await userRepository.getCurrentUser();
      Get.put(UserController(appUser: user));
      // TODO: Navigate to home page

      authChangeControllerCleanup();
      _isRequestInFlight.value = false;
    }
  }

  void onChangeEmail(String value) {
    email.value = value;
  }

  void onChangePassword(String value) {
    password.value = value;
  }

  void onChangeConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  // Clear out any user-specific controllers
  void authChangeControllerCleanup() {
    userRepository.onAuthStateChanged.listen((dynamic fbUser) {
      if (Is.falsy(fbUser)) {
        // TODO: Send user to auth page
        Get.delete<UserController>();
      }
    });
  }

  void onPressedForgotPassword() {
    if (GetUtils.isEmail(email.value)) {
      userRepository.sendPasswordResetEmail(email.value);
    }

    // TODO: Display dialog
  }

  void onPressedSignOut() async {
    _isRequestInFlight.value = true;
    await userRepository.signOut();
    _isRequestInFlight.value = false;
  }

  void onPressedDeleteAccount() async {
    _isRequestInFlight.value = true;
    await userRepository.deleteUser();
    _isRequestInFlight.value = false;
  }

  void clearFields() {
    email.value = '';
    password.value = '';
    confirmPassword.value = '';
  }

  void onPressedSignUp() async {
    _isRequestInFlight.value = true;

    // TODO: add logic to confirm that passwords match

    await userRepository
        .createNewUserWithEmailAndPassword(email.value, password.value)
        .then((AppUser user) {
      Get.put(UserController(appUser: user));

      // TODO: Navigate to onboarding page

      _isRequestInFlight.value = false;
      clearFields();
    }).catchError((dynamic error) async {
      _isRequestInFlight.value = false;
      // TODO: Show error dialog
    });
  }

  void onPressedSignIn() async {
    _isRequestInFlight.value = true;
    await userRepository
        .signInWithEmailAndPassword(email.value, password.value)
        .then((AppUser user) {
      Get.put(UserController(appUser: user));

      // TODO: Navigate to home page

      _isRequestInFlight.value = false;
      clearFields();
    }).catchError((dynamic error) async {
      _isRequestInFlight.value = false;
      // TODO: Show error dialog
    });
  }
}
