/// -----------------------------------------------------------------
///
/// File: sign_in_page_story.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
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
import 'package:push_app/app/pages/general/sign_in_page.dart';
import 'package:push_app/storybook/helper.dart/story_wrapper.dart';
import 'package:push_app/storybook/mocks/providers/mock_auth_provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SignInPageStory extends Story {
  SignInPageStory()
      : super(
            name: 'Sign In',
            section: 'Pages',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) {
              Get.put(MockAuthProvider());
              Get.put(AuthController());
              return StoryWrapper.phoneContainer(
                child: SignInPage(),
                knobsBuilder: knobsBuilder,
              );
            });
}
