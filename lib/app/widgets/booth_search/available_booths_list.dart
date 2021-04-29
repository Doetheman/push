/// -----------------------------------------------------------------
///
/// File: available_booths_list.dart
/// Project: PUSH
/// File Created: Monday, April 26th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Thursday, April 29th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/app/widgets/stylist_home/booth_carousel_card.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';

class AvailableBoothList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoothSearchController controller = Get.find();

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              I18n.of(context)
                  .boothSearchBoothsAvailable(controller.countBooth.toString()),
              style: AppTheme.headlineOne,
            ),
            Spacer(),
            SvgPicture.asset(FILTER_ICON),
          ],
        ).paddingAll(22),
        ...controller.booths.map((Booth booth) =>
            BoothCarouselCard(booth: booth).paddingOnly(bottom: 10))
      ]),
    );
  }
}
