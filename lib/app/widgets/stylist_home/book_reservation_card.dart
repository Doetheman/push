/// -----------------------------------------------------------------
///
/// File: book_reservation_card.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 14th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';

class BookReservationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: AppTheme.offWhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(ADD_ICON),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    I18n.of(context).bookReservationCardTitle,
                    style: AppTheme.headlineThree,
                  ).paddingOnly(bottom: 5),
                  Text(
                    I18n.of(context).bookReservationCardBody,
                    style: AppTheme.bodyTwo.copyWith(
                        fontWeight: FontWeight.w400, color: AppTheme.darkGrey),
                  ),
                ],
              ).paddingSymmetric(horizontal: 15),
            ),
          ],
        ),
      );
}
