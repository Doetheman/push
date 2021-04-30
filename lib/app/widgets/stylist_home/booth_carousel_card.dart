/// -----------------------------------------------------------------
///
/// File: booth_carousel_card.dart
/// Project: PUSH
/// File Created: Saturday, April 24th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/misc/header_label.dart';
import 'package:push_app/app/widgets/misc/image_wrapper.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';

class BoothCarouselCard extends StatelessWidget {
  final Booth booth;

  BoothCarouselCard({
    this.booth,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(
            height: 156,
            child: ListView.separated(
              separatorBuilder: (_, __) => SizedBox(
                width: 10,
              ),
              itemCount: booth.images.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (BuildContext context, int index) => ImageWrapper(
                borderRadius: 5,
                height: 156,
                width: 335,
                file: booth.images[index],
              ),
            ),
          ).paddingOnly(bottom: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: booth.shop.name + ' ',
                        style: AppTheme.subtitleOne,
                      ),
                      TextSpan(
                        text: booth.distance.toPrecision(2).toString() + ' mi',
                        style: AppTheme.bodyTwo.copyWith(
                            color: AppTheme.darkGrey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    I18n.of(context).boothCarouselCardPrice(
                        ((booth.price * .01).toPrecision(2)).toString()),
                    style: AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 20),
          Row(
            children: <Widget>[
              for (int i = 0; i < booth.averageRating; i++)
                SvgPicture.asset(STAR_ICON).paddingOnly(right: 3),
              Expanded(
                child: Text(
                  '• ' + booth.boothName,
                  style: AppTheme.bodyTwo.copyWith(
                      color: AppTheme.darkGrey, fontWeight: FontWeight.w400),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: HeaderLabel(
                  text: I18n.of(context).commonReserve,
                  style:
                      AppTheme.headlineFive.copyWith(color: AppTheme.offWhite),
                  color: AppTheme.primaryRed,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 20),
        ],
      );
}
