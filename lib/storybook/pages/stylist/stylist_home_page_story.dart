/// -----------------------------------------------------------------
///
/// File: stylist_home_page_story.dart
/// Project: PUSH
/// File Created: Saturday, March 20th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:push_app/app/controllers/calendar_controller.dart';
import 'package:push_app/app/controllers/communications_controller.dart';
import 'package:push_app/app/controllers/home_controller.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/pages/stylist/stylist_home_page/stylist_home_page.dart';
import 'package:push_app/storybook/helper.dart/story_wrapper.dart';
import 'package:push_app/storybook/mocks/providers/mock_auth_provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StylistHomePageStory extends Story {
  StylistHomePageStory()
      : super(
            name: 'Stylist Home',
            section: 'Pages',
            builder: (_, KnobsBuilder kB) {
              Get.put<BaseAuthProvider>(MockAuthProvider());
              Get.put(HomeController());
              Get.put(CalendarController());
              Get.put(CommunicationsController());

              return StoryWrapper.phoneContainer(
                knobsBuilder: kB,
                child: StylistHomePage(),
              );
            });
}
