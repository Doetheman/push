/// -----------------------------------------------------------------
///
/// File: booth_search_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 21st, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/utils/is.dart';

class BoothSearchController extends GetxController {
  RxString searchText;
  bool get isEmpty => Is.emptyOrNull(searchText.value);

  TextEditingController searchBarTextController;

  @override
  void onInit() {
    searchText = ''.obs;

    searchBarTextController = TextEditingController();
    super.onInit();
  }

  void onChangeCurrentLocation(String name) {
    searchText.value = name?.trim();
  }

  void clearText() {
    searchBarTextController.clear();
    searchText.value = '';
  }
}
