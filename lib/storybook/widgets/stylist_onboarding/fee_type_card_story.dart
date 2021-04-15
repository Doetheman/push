/// -----------------------------------------------------------------
///
/// File: fee_type_card_story.dart
/// Project: PUSH
/// File Created: Wednesday, April 14th, 2021
/// Description:
///
/// Author: Luchi - you@you.you
/// -----
/// Last Modified: Thursday, April 15th, 2021
/// Modified By: Luchi - you@you.you
/// Last Modified: Thursday, April 15th, 2021
/// Modified By: Luchi - you@you.you
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:push_app/app/widgets/stylist_onboarding/fee_type_card.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/data/models/enums.dart';

class FeeTypeCardStory extends Story {
  FeeTypeCardStory()
      : super(
          name: 'Fee Type Card',
          section: 'Stylist Onboarding',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              FeeTypeCard(
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
