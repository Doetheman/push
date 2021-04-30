/// -----------------------------------------------------------------
///
/// File: stylist_page_stories.dart
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
import 'package:push_app/storybook/pages/stylist/booth_search_page_story.dart';
import 'package:push_app/storybook/pages/stylist/stylist_home_page_story.dart';

List<Widget> buildStylistPageStories() => <Widget>[
      StylistHomePageStory(),
      BoothSearchPageStory(),
    ];
