/// -----------------------------------------------------------------
///
/// File: booth_carousel_card_story.dart
/// Project: PUSH
/// File Created: Saturday, April 24th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Saturday, April 24th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/widgets/stylist_home/booth_carousel_card.dart';
import 'package:push_app/storybook/mocks/providers/mock_auth_provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:get/get.dart';
import 'package:faker/faker.dart';

class BoothCarouselCardStory extends Story {
  BoothCarouselCardStory()
      : super(
          name: 'Booth Carousel Card',
          section: 'Stylist Home',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) {
            Get.put<BaseAuthProvider>(MockAuthProvider());
            return BoothCarouselCard(
              booth: Booth(
                boothName: 'Booth #12',
                price: 300,
                averageRating: 4,
                shopId: 'Cut\'s N Styles',
                distance: 4.7,
                images: List<UserFile>.generate(
                  6,
                  (_) => UserFile(
                    downloadUrl: Faker().image.image(
                      keywords: <String>['hair'],
                    ),
                  ),
                ),
              ),
            );
          },
        );
}
