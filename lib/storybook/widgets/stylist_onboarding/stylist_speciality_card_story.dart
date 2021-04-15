/// -----------------------------------------------------------------
///
/// File: stylist_speciality_card_story.dart
/// Project: PUSH
/// File Created: Wednesday, April 14th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 14th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// Last Modified: Wednesday, April 14th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:push_app/app/data/models/enums.dart';

/// -----------------------------------------------------------------
///
/// File: stylist_speciality_card_story.dart
/// Project: PUSH
/// File Created: Wednesday, April 14th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 14th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/stylist_onboarding/stylist_specialty_card.dart';

class StylistSpecialtyCardStory extends Story {
  StylistSpecialtyCardStory()
      : super(
          name: 'Stylist Specialty Card',
          section: 'Stylist Onboarding',
          builder: (BuildContext buildContext, KnobsBuilder knobsBuilder) =>
              StylistSpecialtyCard(
            specialty: knobsBuilder.options(
              label: 'Specialties',
              initial: Specialties.barbering,
              options: <Option<Specialties>>[
                Option<Specialties>(
                  'Barbering',
                  Specialties.barbering,
                ),
                Option<Specialties>(
                  'Braiding',
                  Specialties.braiding,
                ),
                Option<Specialties>(
                  'Esthetics',
                  Specialties.esthetics,
                ),
                Option<Specialties>(
                  'Hair Coloring',
                  Specialties.hairColoring,
                ),
                Option<Specialties>(
                  'Hair Styling',
                  Specialties.hairStyling,
                ),
                Option<Specialties>(
                  'Makeup',
                  Specialties.makeup,
                ),
                Option<Specialties>(
                  'Nail Tech',
                  Specialties.nailTechnichian,
                ),
                Option<Specialties>(
                  'Piercing',
                  Specialties.piercing,
                ),
                Option<Specialties>(
                  'Tattooing',
                  Specialties.tattooing,
                ),
                Option<Specialties>(
                  'Waxing',
                  Specialties.waxing,
                ),
              ],
            ),
            isSelected: knobsBuilder.boolean(
              label: 'isSelected',
              initial: false,
            ),
            onToggleSelection: (_) {},
          ),
        );
}
