/// -----------------------------------------------------------------
///
/// File: booth_search_input_story.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';
import 'package:push_app/app/widgets/booth_search/booth_search_input.dart';
import 'package:push_app/app/widgets/booth_search/location_list_item.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BoothSearchInputStory extends Story {
  BoothSearchInputStory()
      : super(
            name: 'Booth Search Input',
            section: 'Booth Search',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) {
              Get.put(BoothSearchController());
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
              ));
              return Container(
                child: BoothSearchInput(),
              );
            });
}
