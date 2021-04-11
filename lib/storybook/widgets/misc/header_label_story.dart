/// -----------------------------------------------------------------
///
/// File: header_label_story.dart
/// Project: PUSH
/// File Created: Friday, April 9th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 11th, 2021
/// Last Modified: Sunday, April 11th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Last Modified: Sunday, April 11th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
///
/// -----------------------------------------------------------------

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/misc/header_label.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class HeaderLabelStory extends Story {
  HeaderLabelStory()
      : super(
          name: 'Header Label',
          section: 'Misc',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              HeaderLabel(
            text: 'Hello',
            icon: knobsBuilder.options(
              label: 'Icon',
              initial: null,
              options: <Option<Widget>>[
                Option<Widget>(
                  'None',
                  null,
                ),
                Option<Widget>(
                  'Account Icon',
                  SvgPicture.asset(PLAIN_ACCOUNT),
                ),
                Option<Widget>(
                  'Account Icon Larger',
                  SvgPicture.asset(
                    PLAIN_ACCOUNT,
                    height: 20,
                  ),
                ),
              ],
            ),
            style: knobsBuilder.options(
              label: 'Text Style',
              initial: null,
              options: <Option<TextStyle>>[
                Option<TextStyle>(
                  'None',
                  null,
                ),
                Option<TextStyle>(
                  'Headline Four',
                  AppTheme.headlineFour,
                ),
                Option<TextStyle>(
                  'Headline Two',
                  AppTheme.headlineTwo.copyWith(color: AppTheme.offWhite),
                ),
              ],
            ),
            color: knobsBuilder.options(
              label: 'Color',
              initial: null,
              options: <Option<Color>>[
                Option<Color>(
                  'None',
                  null,
                ),
                Option<Color>(
                  'Off Black',
                  AppTheme.offBlack,
                ),
              ],
            ),
          ),
        );
}
