/// -----------------------------------------------------------------
///
/// File: search_bar_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 21st, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';
import 'package:push_app/app/widgets/booth_search/search_bar.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SearchBarStory extends Story {
  SearchBarStory()
      : super(
          name: 'Search Bar',
          section: 'Booth Search',
          builder: (BuildContext buildContext, KnobsBuilder knobsBuilder) {
            Get.put(BoothSearchController());
            return SearchBar();
          },
        );
}
