/// -----------------------------------------------------------------
///
/// File: auth_page.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Monday, March 15th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/routes.dart';

// TODO
class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Auth'),
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              child: Text('CLICK ME'),
              onTap: () => Get.toNamed(Routes.STYLIST_HOME),
            ),
          ],
        ),
      );
}
