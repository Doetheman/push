/// -----------------------------------------------------------------
///
/// File: top_appbar.dart
/// Project: PUSH
/// File Created: Tuesday, April 6th, 2021
/// Description:
///
/// Author: Dorian - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 25th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/storybook/widgets/misc/svg_button.dart';

class TopAppBar {
  static AppBar build({
    Widget title,
    Widget trailing,
    Function onClickBack,
    bool showBackButton,
  }) =>
      AppBar(
        backgroundColor: AppTheme.offWhite,
        foregroundColor: AppTheme.offBlack,
        titleTextStyle: AppTheme.subtitleOne,
        backwardsCompatibility: false,
        actions: trailing != null ? <Widget>[trailing] : null,
        title: title,
        automaticallyImplyLeading: showBackButton,
        elevation: 0,
        centerTitle: true,
        leading: showBackButton
            ? Container(
                child: SvgButton(
                  svg: BACK_ARROW_ICON,
                  color: AppTheme.darkGrey,
                  onPressed: onClickBack,
                ).paddingAll(20),
              )
            : null,
      );
}
