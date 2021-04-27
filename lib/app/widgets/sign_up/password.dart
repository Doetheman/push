/// -----------------------------------------------------------------
///
/// File: password.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/fields/text_input_field.dart';
import 'package:push_app/generated/i18n.dart';
import 'package:get/get.dart';

class PasswordInput extends StatelessWidget {
  final bool isSignUp;

  PasswordInput({
    this.isSignUp = true,
  });

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              isSignUp
                  ? I18n.of(context).emailInputNewPassword
                  : I18n.of(context).emailInputExistingPassword,
              style: AppTheme.headlineOne,
            ).paddingOnly(bottom: 20),
            TextInputField(
              labelText: I18n.of(context).commonPassword,
              isPassword: true,
            ),
          ],
        ),
      );
}
