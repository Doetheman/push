/// -----------------------------------------------------------------
///
/// File: location_list_item_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 20th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/booth_search/location_list_item.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LocationListItemStory extends Story {
  LocationListItemStory()
      : super(
          name: 'Location List Item',
          section: 'Booth Search',
          builder: (BuildContext buildContext, KnobsBuilder knobsBuilder) =>
              LocationListItem(
            cityAndState: knobsBuilder.options(
              label: 'Cities and States',
              initial: 'Richmond, VA',
              options: <Option<String>>[
                Option<String>(
                  'Richmond',
                  'Richmond, VA',
                ),
                Option<String>(
                  'Richardson',
                  'Richardson, TX',
                ),
                Option<String>(
                  'Richland',
                  'Richland, WA',
                ),
              ],
            ),
          ),
        );
}
