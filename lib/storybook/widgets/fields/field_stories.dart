/// -----------------------------------------------------------------
///
/// File: field_stories.dart
/// Project: PUSH
/// File Created: Wednesday, March 31st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/storybook/widgets/fields/radio_group_field_story.dart';
import 'package:push_app/storybook/widgets/fields/multi_select_field_story.dart';
import 'package:push_app/storybook/widgets/fields/text_input_field_story.dart';

List<Widget> buildFieldStories() => <Widget>[
      TextInputFieldStory(),
      RadioGroupFieldStory(),
      MultiSelectFieldStory(),
    ];
