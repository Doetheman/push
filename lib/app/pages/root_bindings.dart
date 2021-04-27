/// -----------------------------------------------------------------
///
/// File: root_bindings.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 27th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:push_app/app/controllers/auth_controller.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';
import 'package:push_app/app/controllers/calendar_controller.dart';
import 'package:push_app/app/controllers/communications_controller.dart';
import 'package:push_app/app/controllers/home_controller.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/storybook/mocks/providers/mock_auth_provider.dart';

class RootBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut<BaseAuthProvider>(() => MockAuthProvider());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CalendarController());
    Get.lazyPut(() => CommunicationsController());
    Get.lazyPut(() => BoothSearchController());
  }
}
