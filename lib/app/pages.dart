/// -----------------------------------------------------------------
///
/// File: pages.dart
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
// ignore_for_file: always_specify_types

import 'package:get/get.dart';
import 'package:push_app/app/pages/stylist/stylist_home_page/booth_search_page.dart';
import 'package:push_app/app/pages/general/sign_in_page.dart';
import 'package:push_app/app/pages/stylist/stylist_home_page/stylist_home_page.dart';
import 'package:push_app/app/routes.dart';

abstract class Pages {
  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInPage(),
    ),
    GetPage(
      name: Routes.STYLIST_HOME,
      page: () => StylistHomePage(),
    ),
    GetPage(
      name: Routes.BOOTH_SEARCH,
      page: () => BoothSearchPage(),
    ),
  ];
}
