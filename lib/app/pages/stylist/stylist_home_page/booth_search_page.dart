/// -----------------------------------------------------------------
///
/// File: booth_search_page.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';
import 'package:push_app/app/widgets/booth_search/booth_search_input.dart';

class BoothSearchPage extends StatelessWidget {
  final BoothSearchController controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (controller.isEnteringSearchText)
                BoothSearchInput().paddingAll(20),
            ],
          ),
        ),
      );
}
