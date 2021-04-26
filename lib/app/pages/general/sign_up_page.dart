/// -----------------------------------------------------------------
///
/// File: sign_up_page.dart
/// Project: PUSH
/// File Created: Saturday, April 24th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 25th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/stylist_onboarding_controller.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/widgets/misc/action_button.dart';
import 'package:push_app/app/widgets/misc/top_app_bar.dart';
import 'package:push_app/app/widgets/stylist_onboarding/speciality_multi_select.dart';
import 'package:push_app/app/widgets/stylist_onboarding/fee_types.dart';
import 'package:push_app/app/widgets/stylist_onboarding/stylist_basic_info_input.dart';
import 'package:push_app/app/widgets/stylist_onboarding/user_type_card.dart';
import 'package:push_app/generated/i18n.dart';

class SignUpPage extends StatelessWidget {
  final StylistOnboardingController stylistOnboardingController = Get.find();

  OnboardingStep get step => stylistOnboardingController.currentStep;

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: TopAppBar.build(
            title: Text(I18n.of(context).signUpPageSignup),
            showBackButton: stylistOnboardingController.currentStep !=
                OnboardingStep.userTypeSelecton,
            onClickBack: () => stylistOnboardingController.onPressedBack(),
          ),
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (stylistOnboardingController.currentStep ==
                      OnboardingStep.userTypeSelecton)
                    UserTypeCard(userType: UserType.stylist)
                        .paddingOnly(bottom: 20),
                  if (step == OnboardingStep.userTypeSelecton)
                    UserTypeCard(userType: UserType.owner),
                  if (step == OnboardingStep.feeTypes) FeeTypes(),
                  if (step == OnboardingStep.basicInfo) StylistBasicInfoInput(),
                  if (step == OnboardingStep.specialities)
                    SpecialityMultiSelect(
                      label: I18n.of(context).signUpPageSpecialities,
                      selectedOptions:
                          stylistOnboardingController.selectedSpecialities,
                    ).paddingOnly(bottom: 20),
                  if (step != OnboardingStep.userTypeSelecton)
                    ActionButton(
                      text: step == OnboardingStep.feeTypes
                          ? I18n.of(context).signUpPageStartStyling
                          : I18n.of(context).signUpPageContine,
                      onPressed: stylistOnboardingController.onPressContinue,
                      isDisabled: !stylistOnboardingController.canContinue,
                    ),
                ],
              ),
            ).paddingAll(20),
          ),
        ),
      );
}
