/// -----------------------------------------------------------------
///
/// File: user_controller.dart
/// Project: PUSH
/// File Created: Saturday, March 27th, 2021
/// Description:
///
///     This controller is used to maintain the state for the currently
///     logged in user.
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:push_app/app/data/models/app_user.dart';
import 'package:push_app/app/data/models/enums.dart';

class UserController extends GetxController {
  // Currently logged in user
  Rx<AppUser> _user;
  AppUser get user => _user.value;
  bool get isAdmin => _user.value.type == UserType.admin;
  bool get isOwner => _user.value.type == UserType.owner;
  bool get isStylist => _user.value.type == UserType.stylist;

  // Used for loading indicators
  RxBool _isRequestInFlight;
  bool get isRequestInFlight => _isRequestInFlight.value;

  UserController({AppUser appUser}) {
    _user = (appUser ?? AppUser()).obs;
  }

  void updateUser(AppUser user) {
    _user.value = user;
    _user.refresh();
  }
}
