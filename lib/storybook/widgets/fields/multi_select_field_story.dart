/// -----------------------------------------------------------------
///
/// File: multi_select_field_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 6th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:push_app/app/widgets/fields/multi_select_field.dart';
import 'package:flutter/material.dart';

class MultiSelectFieldStory extends Story {
  MultiSelectFieldStory()
      : super(
            name: 'Multi Select Field',
            section: 'Fields',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) {
              List<String> options = <String>[
                'Fixed',
                'Commission',
                'Fixed + Commission',
              ];
              List<String> selectedOptions = <String>[
                'Fixed',
                'Fixed + Commission',
              ];
              return MultiSelectFilter<String>(
                label: 'Reservation Fee Type',
                selectedOptions: selectedOptions,
                options: options,
                onSelectionsChanged: (_) {},
              );
            });
}
