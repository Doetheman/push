/// -----------------------------------------------------------------
///
/// File: top_app_bar_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 6th, 2021
/// Description:
///
/// Author: Dorian - dorian@longsoftware.io
/// -----
/// Last Modified: Friday, April 9th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/misc/top_app_bar.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TopAppBarStory extends Story {
  TopAppBarStory()
      : super(
          name: 'Top App Bar',
          section: 'Misc',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              Scaffold(
            appBar: TopAppBar.build(
              title: Text('Test App Bar'),
              trailing: knobsBuilder.options<Widget>(
                label: 'Trailing Widget',
                initial: null,
                options: <Option<Widget>>[
                  Option<Widget>(
                    'None',
                    null,
                  ),
                  Option<Widget>(
                    'Skip',
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: AppTheme.offBlack,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Skip',
                      ),
                    ),
                  ),
                ],
              ),
              showBackButton: knobsBuilder.boolean(
                initial: false,
                label: 'showBackButton',
              ),
            ),
          ),
        );
}
