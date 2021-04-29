/// -----------------------------------------------------------------
///
/// File: booth_condensed_card_story.dart
/// Project: PUSH
/// File Created: Thursday, April 29th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Thursday, April 29th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/models/shop.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/widgets/stylist_reserve/booth_condensed_card.dart';
import 'package:push_app/storybook/mocks/providers/mock_auth_provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:get/get.dart';
import 'package:faker/faker.dart';

class BoothCondensedCardStory extends Story {
  BoothCondensedCardStory()
      : super(
          name: 'Booth Condensed Card',
          section: 'Stylist Reserve',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) {
            Get.put<BaseAuthProvider>(MockAuthProvider());
            return BoothCondensedCard(
              booth: Booth(
                boothName: 'Booth #12',
                price: 300,
                shop: Shop(
                  name: 'Cuts n\' Styles',
                  address: '123 Main St Richmond, VA',
                ),
                images: List<UserFile>.generate(
                  1,
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
