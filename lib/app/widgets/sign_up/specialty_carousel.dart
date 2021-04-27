/// -----------------------------------------------------------------
///
/// File: specialty_carousel.dart
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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/stylist_onboarding/stylist_specialty_card.dart';

class SpecialtyCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 129,
        width: Get.width,
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 187.5 / 129,
            viewportFraction: 187.5 / Get.width,
            autoPlay: true,
            autoPlayInterval: Duration(
              seconds: 1,
            ),
          ),
          items: Specialties.values
              .map(
                (Specialties option) => Container(
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: AppTheme.darkGrey,
                    ),
                    child: StylistSpecialtyCard(
                      isSelected: false,
                      specialty: option,
                      onToggleSelection: (_) {},
                    ),
                  ),
                ).paddingOnly(right: 30),
              )
              .toList(),
        ),
      );
}
