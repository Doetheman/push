/// -----------------------------------------------------------------
///
/// File: fee_type_description_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 13th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/widgets/stylist_onboarding/fee_type_description.dart';

class FeeTypeDescriptionStory extends Story {
  FeeTypeDescriptionStory()
      : super(
          name: 'Fee Type Description',
          section: 'Stylist Onboarding',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              FeeTypeDescription(
            feeType: knobsBuilder.options(
              label: 'Fee Type',
              initial: FeeType.fixed,
              options: <Option<FeeType>>[
                Option<FeeType>(
                  'Fixed',
                  FeeType.fixed,
                ),
                Option<FeeType>(
                  'Commission',
                  FeeType.commission,
                ),
                Option<FeeType>(
                  'Fixed + Commission',
                  FeeType.fixedAndCommission,
                ),
              ],
            ),
          ),
        );
}
