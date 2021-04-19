/// -----------------------------------------------------------------
///
/// File: stylist_home_app_bar_story.dart
/// Project: PUSH
/// File Created: Sunday, April 18th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Sunday, April 18th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/calendar_controller.dart';
import 'package:push_app/app/controllers/communications_controller.dart';
import 'package:push_app/app/controllers/home_controller.dart';
import 'package:push_app/app/widgets/stylist_home/stylist_home_app_bar.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StylistHomeAppBarStory extends Story {
  StylistHomeAppBarStory()
      : super(
            name: 'Stylist Home App Bar',
            section: 'Stylist Home',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) {
              Get.put(HomeController());
              Get.put(CalendarController());
              Get.put(CommunicationsController());

              return Scaffold(
                appBar: StylistHomeAppBar.build(),
              );
            });
}
