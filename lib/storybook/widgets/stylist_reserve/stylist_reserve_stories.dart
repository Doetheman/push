/// -----------------------------------------------------------------
///
/// File: stylist_reserve_stories.dart
/// Project: PUSH
/// File Created: Wednesday, April 28th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Thursday, April 29th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:push_app/storybook/widgets/stylist_reserve/booth_condensed_card_story.dart';
import 'package:push_app/storybook/widgets/stylist_reserve/hour_selection_button_story.dart';

List<Widget> buildStylistReserveStories() => <Widget>[
      HourSelectionButtonStory(),
      BoothCondensedCardStory(),
    ];
