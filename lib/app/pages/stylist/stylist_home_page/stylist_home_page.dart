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
import 'package:push_app/generated/i18n.dart';

// TODO
class StylistHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(I18n.of(context).commonStylist),
        ),
        body: Center(
          child: Text('Coming soon'),
        ),
      );
}
