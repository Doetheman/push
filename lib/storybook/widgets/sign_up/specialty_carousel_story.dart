/// -----------------------------------------------------------------
///
/// File: specialty_carousel_story.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/sign_up/specialty_carousel.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SpecialtyCarouselStory extends Story {
  SpecialtyCarouselStory()
      : super(
          name: 'Specality Carousel',
          section: 'Sign Up',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              SpecialtyCarousel(),
        );
}
