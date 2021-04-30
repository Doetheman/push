/// -----------------------------------------------------------------
///
/// File: booth_search_page_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 27th, 2021
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

import 'package:get/get.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/pages/stylist/stylist_home_page/booth_search_page.dart';
import 'package:push_app/storybook/helper.dart/story_wrapper.dart';
import 'package:push_app/storybook/mocks/providers/mock_auth_provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BoothSearchPageStory extends Story {
  BoothSearchPageStory()
      : super(
            name: 'Booth Search',
            section: 'Pages',
            builder: (_, KnobsBuilder kB) {
              Get.put<BaseAuthProvider>(MockAuthProvider());
              Get.put(BoothSearchController());

              return StoryWrapper.phoneContainer(
                knobsBuilder: kB,
                child: BoothSearchPage(),
              );
            });
}
