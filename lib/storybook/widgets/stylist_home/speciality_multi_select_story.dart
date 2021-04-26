/// -----------------------------------------------------------------
///
/// File: speciality_multi_select_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 25th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/widgets/stylist_onboarding/speciality_multi_select.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SpecialityMultiSelectStory extends Story {
  SpecialityMultiSelectStory()
      : super(
          name: 'Speciality Multi Select',
          section: 'Stylist Home',
          builder: (BuildContext buildContext, KnobsBuilder knobsBuilder) {
            List<Specialties> selectedOptions = <Specialties>[
              Specialties.barbering,
              Specialties.waxing,
            ];

            return ListView(
              children: <Widget>[
                SpecialityMultiSelect(
                  selectedOptions: selectedOptions,
                  label: 'What type of styling are you looking to do?',
                ),
              ],
            );
          },
        );
}
