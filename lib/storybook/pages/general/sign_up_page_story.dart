/// -----------------------------------------------------------------
///
/// File: sign_up_page_story.dart
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

import 'package:get/get.dart';
import 'package:push_app/app/controllers/stylist_onboarding_controller.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/pages/general/sign_up_page.dart';
import 'package:push_app/storybook/helper.dart/story_wrapper.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SignUpPageStory extends Story {
  SignUpPageStory()
      : super(
            name: 'Sign Up',
            section: 'Pages',
            builder: (_, KnobsBuilder knobsBuilder) {
              StylistOnboardingController controller =
                  Get.put(StylistOnboardingController());

              controller.updateStep(
                knobsBuilder.options(
                  label: 'Onboarding Step',
                  initial: OnboardingStep.userTypeSelecton,
                  options: <Option<OnboardingStep>>[
                    Option<OnboardingStep>(
                        'User Type', OnboardingStep.userTypeSelecton),
                    Option<OnboardingStep>(
                        'Basic Info', OnboardingStep.basicInfo),
                    Option<OnboardingStep>(
                        'Specialities', OnboardingStep.specialities),
                    Option<OnboardingStep>(
                        'Fee Types', OnboardingStep.feeTypes),
                  ],
                ),
              );
              return StoryWrapper.phoneContainer(
                knobsBuilder: knobsBuilder,
                child: SignUpPage(),
              );
            });
}
