/// -----------------------------------------------------------------
///
/// File: email_input.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/controllers/auth_controller.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/fields/text_input_field.dart';
import 'package:push_app/generated/i18n.dart';

class EmailInput extends StatelessWidget {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            I18n.of(context).emailInputInputHeader,
            style: AppTheme.headlineThree,
          ),
          Text(
            I18n.of(context).emailInputInputSubtitle,
            style: AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
          ).paddingOnly(top: 20, bottom: 20),
          TextInputField(
            onChanged: controller.onChangeEmail,
            labelText: I18n.of(context).emailInputPlaceHolder,
          ),
        ],
      );
}
