/// -----------------------------------------------------------------
///
/// File: colors_story.dart
/// Project: PUSH
/// File Created: Monday, March 29th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ColorsStory extends Story {
  ColorsStory()
      : super(
            name: 'Colors',
            section: 'Theme',
            builder: (_, KnobsBuilder kB) {
              Map<String, Color> colors = <String, Color>{
                // Primaries
                'Primary Blue': AppTheme.primaryBlue,
                'Primary Green': AppTheme.primaryGreen,
                'Primary Red': AppTheme.primaryRed,
                'Yellow': AppTheme.yellow,

                // Secondaries
                'Secondary Blue': AppTheme.secondaryBlue,
                'Secondary Green': AppTheme.secondaryGreen,
                'Secondary Red': AppTheme.secondaryRed,

                // Greyscale
                'Off Black': AppTheme.offBlack,
                'Dark Grey': AppTheme.darkGrey,
                'Medium Grey': AppTheme.mediumGrey,
                'Light Grey': AppTheme.lightGrey,
                'Off White': AppTheme.offWhite,
              };

              return Center(
                child: Wrap(
                  children: colors.keys
                      .map(
                        (String color) => Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(color).paddingOnly(bottom: 10),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colors[color],
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                          ],
                        ).paddingAll(10),
                      )
                      .toList(),
                ).paddingAll(25),
              );
            });
}
