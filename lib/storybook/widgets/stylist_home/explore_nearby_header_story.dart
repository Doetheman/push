/// -----------------------------------------------------------------
///
/// File: explore_nearby_header_story.dart
/// Project: PUSH
/// File Created: Thursday, April 22nd, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Friday, April 23rd, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/home_controller.dart';
import 'package:push_app/app/widgets/stylist_home/explore_nearby_header.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ExploreNearbyHeaderStory extends Story {
  ExploreNearbyHeaderStory()
      : super(
          name: 'Explore Nearby Header',
          section: 'Stylist Home',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) {
            Get.put(HomeController());
            return ExploreNearbyHeader();
          },
        );
}
