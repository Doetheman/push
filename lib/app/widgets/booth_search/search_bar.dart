/// -----------------------------------------------------------------
///
/// File: search.dart
/// Project: PUSH
/// File Created: Tuesday, April 20th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 27th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/booth_search_controller.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';

class SearchBar extends StatelessWidget {
  final BoothSearchController controller = Get.find();

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppTheme.offWhite,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        width: Get.width,
        height: 30,
        child: Obx(
          () => TextField(
            decoration: InputDecoration(
              hintText: I18n.of(context).searchBarHintText,
              hintStyle: AppTheme.bodyTwo.copyWith(color: AppTheme.darkGrey),
              border: InputBorder.none,
              focusColor: AppTheme.darkGrey,
              prefixIcon: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(BACK_ARROW_ICON, color: Colors.black),
              ).paddingOnly(right: 16.59, left: 16, top: 9, bottom: 9),
              suffixIcon: controller.isEmpty
                  ? null
                  : GestureDetector(
                      onTap: controller.clearText,
                      child: SvgPicture.asset(
                        CIRCLE_X,
                      ),
                    ).paddingSymmetric(vertical: 7.5),
            ),
            cursorColor: AppTheme.offBlack,
            textAlignVertical: TextAlignVertical.bottom,
            style: AppTheme.bodyTwo.copyWith(color: AppTheme.darkGrey),
            cursorHeight: 15,
            textAlign: TextAlign.start,
            onChanged: controller.onChangeSearchText,
            controller: controller.searchBarTextController,
          ),
        ),
      );
}
