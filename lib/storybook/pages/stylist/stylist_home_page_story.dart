/// -----------------------------------------------------------------
///
/// File: stylist_home_page_story.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:push_app/app/pages/stylist/stylist_home_page/stylist_home_page.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StylistHomePageStory extends Story {
  StylistHomePageStory()
      : super(
          name: 'Stylist Home',
          section: 'Pages',
          builder: (_, KnobsBuilder kB) => StylistHomePage(),
        );
}
