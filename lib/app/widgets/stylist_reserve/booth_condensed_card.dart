/// -----------------------------------------------------------------
///
/// File: booth_condensed_card.dart
/// Project: PUSH
/// File Created: Thursday, April 29th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Thursday, April 29th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/misc/image_wrapper.dart';
import 'package:push_app/generated/i18n.dart';

class BoothCondensedCard extends StatelessWidget {
  final Booth booth;
  final int index;

  BoothCondensedCard({
    this.booth,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 75,
        child: Row(
          children: <Widget>[
            ImageWrapper(
              borderRadius: 4.17,
              height: 75,
              width: 75,
              file: booth.images[index],
            ).paddingOnly(right: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  booth.shop.name,
                  style: AppTheme.subtitleOne,
                ),
                Text(
                  booth.boothName +
                      ' • ' +
                      I18n.of(context).boothCarouselCardPrice(
                          (booth.price * .01).toPrecision(2).toString()),
                  style: AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
                ),
                Text(
                  booth.shop.address,
                  style: AppTheme.bodyTwo.copyWith(color: AppTheme.darkGrey),
                ),
              ],
            ),
          ],
        ),
      );
}
