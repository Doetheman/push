/// -----------------------------------------------------------------
///
/// File: auth_page.dart
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/auth_controller.dart';
import 'package:push_app/app/widgets/misc/action_button.dart';
import 'package:push_app/app/widgets/sign_up/email_input.dart';
import 'package:push_app/app/widgets/sign_up/password.dart';
import 'package:push_app/app/widgets/sign_up/specialty_carousel.dart';
import 'package:push_app/generated/i18n.dart';

class SignInPage extends StatelessWidget {
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Obx(
          () => Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    if (controller.isEmail)
                      SpecialtyCarousel().paddingSymmetric(vertical: 30),
                    if (controller.isEmail)
                      EmailInput().paddingSymmetric(horizontal: 20),
                    if (!controller.isEmail)
                      PasswordInput(
                        isSignUp: false,
                      ).paddingSymmetric(horizontal: 20),
                  ],
                ),
              ),
              ActionButton(
                text: I18n.of(context).signUpPageContinue,
                isDisabled: !controller.canContinue,
                onPressed: controller.onPressContinue,
              ).paddingAll(20)
            ],
          ),
        ),
      );
}
