/// -----------------------------------------------------------------
///
/// File: recent_search_list_item_story.dart
/// Project: PUSH
/// File Created: Wednesday, April 21st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 21st, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/booth_search.dart';
import 'package:push_app/app/widgets/booth_search/recent_search_list_item.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class RecentSearchListItemStory extends Story {
  RecentSearchListItemStory()
      : super(
          name: 'Recent Search List Item',
          section: 'Booth Search',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              RecentSearchListItem(
            boothSearch: BoothSearch(
              location: knobsBuilder.options(
                label: 'Location',
                initial: 'Richmond, VA',
                options: <Option<String>>[
                  Option<String>(
                    'Richmond',
                    'Richmond, VA',
                  ),
                  Option<String>(
                    'D.C',
                    'Washington D.C.',
                  ),
                  Option<String>(
                    'Richland',
                    'Richland, VA',
                  ),
                ],
              ),
              minimumHoursAvailable: knobsBuilder.options(
                label: 'Min Hours Available',
                initial: 30,
                options: <Option<int>>[
                  Option<int>(
                    '30 Hours',
                    30,
                  ),
                  Option<int>(
                    '2 Hours',
                    2,
                  ),
                  Option<int>(
                    '8 Hours',
                    8,
                  ),
                ],
              ),
              maxHoursAvailable: knobsBuilder.options(
                label: 'Max Hours Available',
                initial: 40,
                options: <Option<int>>[
                  Option<int>(
                    '40 Hours',
                    40,
                  ),
                  Option<int>(
                    '5 Hours',
                    5,
                  ),
                  Option<int>(
                    '12 Hours',
                    12,
                  ),
                ],
              ),
              minDaysFromNow: knobsBuilder.options(
                label: 'Min Days From Now',
                initial: 14,
                options: <Option<int>>[
                  Option<int>(
                    '14 Days',
                    14,
                  ),
                  Option<int>(
                    '3 Days',
                    3,
                  ),
                  Option<int>(
                    '1 Day',
                    1,
                  ),
                ],
              ),
            ),
          ),
        );
}
