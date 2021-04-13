/// -----------------------------------------------------------------
///
/// File: user_type_card.dart
/// Project: PUSH
/// File Created: Monday, April 12th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 13th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

/// -----------------------------------------------------------------
///
/// File: user_type_card.dart
/// Project: PUSH
/// File Created: Monday, April 12th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Monday, April 12th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/misc/header_label.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/assets/images/images.dart';
import 'package:push_app/generated/i18n.dart';

class UserTypeCard extends StatelessWidget {
  final UserType userType;
  bool get isStylist => userType == UserType.stylist;

  String get backgroundImage =>
      userType == UserType.stylist ? STYLIST_BACKGROUND : SHOP_OWNER_BACKGROUND;

  UserTypeCard({
    this.userType,
  });

  Widget userTypeCardText(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderLabel(
              color: AppTheme.primaryRed,
              style: AppTheme.headlineTwo.copyWith(color: AppTheme.offWhite),
              text: (isStylist
                      ? I18n.of(context).commonStylist
                      : I18n.of(context).commonShopOwner)
                  .capitalize,
            ),
            SizedBox(height: 10.0),
            Text(
              (isStylist
                  ? I18n.of(context).userTypeCardStylistBody
                  : I18n.of(context).userTypeCardShopOwnerBody),
              style: AppTheme.headlineThree.copyWith(color: AppTheme.offWhite),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: Container(
          width: Get.width,
          height: 327,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.srcATop,
              ),
              image: AssetImage(backgroundImage),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              userTypeCardText(context),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.5),
                    color: AppTheme.offBlack,
                  ),
                  child: SvgPicture.asset(
                    RIGHT_ARROW,
                  ).paddingAll(9),
                ),
              )
            ],
          ).paddingAll(20),
        ),
      );
}
