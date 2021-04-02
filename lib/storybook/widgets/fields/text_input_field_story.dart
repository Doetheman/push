/// -----------------------------------------------------------------
///
/// File: text_inputfield_stories.dart
/// Project: PUSH
/// File Created: Wednesday, March 31st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Friday, April 2nd, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter_svg/svg.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/fields/text_input_field.dart';

class TextInputFieldStory extends Story {
  TextInputFieldStory()
      : super(
          name: 'Text Input Field',
          section: 'Fields',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              TextInputField(
            isPassword: knobsBuilder.boolean(
              label: 'isPassword',
              initial: false,
            ),
            suffixIcon: knobsBuilder.options<Widget>(
              label: 'suffixIcon',
              initial: null,
              options: <Option<Widget>>[
                Option<Widget>(
                  'Location Icon',
                  SvgPicture.asset(
                    LOCATION_ICON,
                  ),
                ),
                Option<Widget>(
                  'None',
                  null,
                ),
              ],
            ),
          ),
        );
}
