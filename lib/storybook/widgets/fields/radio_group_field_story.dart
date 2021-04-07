/// -----------------------------------------------------------------
///
/// File: radio_group_field_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 6th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 6th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/fields/radio_group_field.dart';

class RadioGroupFieldStory extends Story {
  RadioGroupFieldStory()
      : super(
            name: 'Radio Group Field',
            section: 'Fields',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) {
              final List<RadioOption> options = <RadioOption>[
                RadioOption(
                  label: 'Today',
                  value: 1,
                ),
                RadioOption(
                  label: 'Tomorrow',
                  value: 2,
                ),
                RadioOption(
                  label: 'Anytime This Week',
                  value: 3,
                ),
              ];
              return RadioGroupField(
                label: 'Reservation Availablity',
                selectedOption: options[0],
                options: options,
                onSelectionChanged: (_) {},
              );
            });
}
