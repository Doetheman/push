/// -----------------------------------------------------------------
///
/// File: stylist_basic_info_input_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 20th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/stylist_onboarding_controller.dart';
import 'package:push_app/app/widgets/stylist_onboarding/stylist_basic_info_input.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StylistBasicInfoInputStory extends Story {
  StylistBasicInfoInputStory()
      : super(
            name: 'Stylist Basic Info Input',
            section: 'Stylist Onboarding',
            builder: (BuildContext context, KnobsBuilder knobBuilder) {
              Get.put(StylistOnboardingController());
              return StylistBasicInfoInput();
            });
}
