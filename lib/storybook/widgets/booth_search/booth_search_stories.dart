/// -----------------------------------------------------------------
///
/// File: booth_search_stories.dart
/// Project: PUSH
/// File Created: Wednesday, April 21st, 2021
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
import 'package:push_app/storybook/widgets/booth_search/location_list_item_story.dart';
import 'package:push_app/storybook/widgets/booth_search/recent_search_list_item_story.dart';
import 'package:push_app/storybook/widgets/booth_search/search_bar_story.dart';

List<Widget> buildBoothSearchStories() => <Widget>[
      RecentSearchListItemStory(),
      LocationListItemStory(),
      SearchBarStory(),
    ];
