/// -----------------------------------------------------------------
///
/// File: available_booth_list_story.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----------------------------------------------------------------

import 'package:push_app/app/data/providers/auth_provider.dart';

import 'package:push_app/app/widgets/booth_search/available_booths_list.dart';
import 'package:push_app/storybook/mocks/providers/mock_auth_provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';

class AvailableBoothListStory extends Story {
  AvailableBoothListStory()
      : super(
            name: 'Available Booth List',
            section: 'Booth Search',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) {
              Get.put<BaseAuthProvider>(MockAuthProvider());
              Get.put(BoothSearchController());

              return SizedBox(child: AvailableBoothList());
            });
}
