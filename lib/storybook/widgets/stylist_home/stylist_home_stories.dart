/// -----------------------------------------------------------------
///
/// File: stylist_home_stories.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
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
import 'package:push_app/storybook/widgets/stylist_home/book_reservation_card_story.dart';
import 'package:push_app/storybook/widgets/stylist_home/explore_nearby_header_story.dart';
import 'package:push_app/storybook/widgets/stylist_home/speciality_multi_select_story.dart';
import 'package:push_app/storybook/widgets/stylist_home/stylist_home_app_bar_story.dart';

List<Widget> buildStylistHomeStories() => <Widget>[
      BookReservationCardStory(),
      StylistHomeAppBarStory(),
      SpecialityMultiSelectStory(),
      ExploreNearbyHeaderStory(),
    ];
