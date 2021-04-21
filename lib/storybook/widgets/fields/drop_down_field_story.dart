/// -----------------------------------------------------------------
///
/// File: drop_down_field_story.dart
/// Project: PUSH
/// File Created: Friday, April 9th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 20th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:push_app/app/constants/states.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/fields/drop_down_field.dart';

class DropDownFieldStory extends Story {
  DropDownFieldStory()
      : super(
            name: 'Drop Down Field',
            section: 'Fields',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
                DropDownField<String>(
                  options: STATES,
                  hintText: 'State',
                  onSelectOption: (_) {},
                ));
}
