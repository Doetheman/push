/// -----------------------------------------------------------------
///
/// File: stylist_home_app_bar.dart
/// Project: PUSH
/// File Created: Monday, April 12th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 18th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/calendar_controller.dart';
import 'package:push_app/app/controllers/communications_controller.dart';
import 'package:push_app/app/controllers/home_controller.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';
import 'package:push_app/generated/i18n.dart';
import 'package:push_app/storybook/widgets/misc/svg_button.dart';

class CommunicationsAppBar extends StatelessWidget {
  final HomeController homeController = Get.find();
  final CommunicationsController communicationsController = Get.find();

  final TextStyle activeTabStyle = AppTheme.headlineThree.copyWith(
    color: Colors.transparent,
    decoration: TextDecoration.underline,
    shadows: <Shadow>[
      Shadow(
        color: AppTheme.offBlack,
        offset: Offset(0, -5),
      ),
    ],
    decorationColor: AppTheme.offBlack,
    decorationThickness: 1,
    decorationStyle: TextDecorationStyle.solid,
  );

  final TextStyle inactiveTabStyle = AppTheme.headlineThree.copyWith(
    color: Colors.transparent,
    decoration: TextDecoration.underline,
    shadows: <Shadow>[
      Shadow(
        color: AppTheme.darkGrey,
        offset: Offset(0, -5),
      ),
    ],
    decorationColor: AppTheme.darkGrey,
    decorationThickness: 1,
    decorationStyle: TextDecorationStyle.solid,
  );

  @override
  Widget build(BuildContext context) => Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () => communicationsController.onPressTab(true),
              child: Text(
                I18n.of(context).commonMessages,
                style: communicationsController.isOnConversationsTab
                    ? activeTabStyle
                    : inactiveTabStyle,
              ),
            ),
            GestureDetector(
              onTap: () => communicationsController.onPressTab(false),
              child: Text(
                I18n.of(context).commonNotifications,
                style: !communicationsController.isOnConversationsTab
                    ? activeTabStyle
                    : inactiveTabStyle,
              ),
            ).paddingOnly(left: 15),
            Spacer(),
            SvgButton(
              svg: communicationsController.hasUnreadConversations ||
                      communicationsController.hasUnreadNotifications
                  ? COMMUNICATION_NOTIFICATION_OFFBLACK
                  : COMMUNICATION_OFFBLACK_ICON,
              onPressed: () => homeController.onToggleCommunicationsView(),
            ),
          ],
        ),
      );
}

class DefaultHomeAppBar extends StatelessWidget {
  final HomeController homeController = Get.find();
  final CommunicationsController communicationsController = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Row(
          children: <Widget>[
            SvgButton(
              svg: CALENDAR_ICON,
              onPressed: () => homeController.onToggleCalendarView(),
            ).paddingOnly(right: 13),
            Text(homeController.todayDate, style: AppTheme.subtitleOne),
            Spacer(),
            SvgButton(
              svg: communicationsController.hasUnreadConversations ||
                      communicationsController.hasUnreadNotifications
                  ? COMMUNICATION_NOTIFCATION_ICON
                  : COMMUNICATION_ICON,
              onPressed: () => homeController.onToggleCommunicationsView(),
            )
          ],
        ),
      );
}

class CalendarAppBar extends StatelessWidget {
  final HomeController homeController = Get.find();
  final CalendarController calendarController = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Row(
          children: <Widget>[
            SvgButton(
              svg: CALENDAR_OFF_BLACK_ICON,
              onPressed: () => homeController.onToggleCalendarView(),
            ).paddingOnly(right: 13),
            Text(calendarController.selectedDate, style: AppTheme.subtitleOne),
            Spacer(),
            SvgButton(
              svg: LEFT_ARROW_ICON,
              onPressed: () {},
            ).paddingOnly(right: 30),
            SvgButton(
              svg: RIGHT_ARROW_ICON,
              onPressed: () {},
            )
          ],
        ).paddingOnly(bottom: 4),
      );
}

class AppBarSubTitle extends StatelessWidget {
  final HomeController homeController = Get.find();
  final CalendarController calendarController = Get.find();
  final CommunicationsController communicationsController = Get.find();

  String getCalendarViewSubTitle(BuildContext context) =>
      calendarController.reservationAmount == 1
          ? I18n.of(context)
              .topBarYouHaveOneReservationOn(calendarController.reservationDate)
          : I18n.of(context).topBarYouHaveReservationsOn(
              calendarController.reservationAmount.toString(),
              calendarController.reservationDate,
            );

  String getHomeViewSubTitle(BuildContext context) =>
      homeController.reservationsToday == 1
          ? I18n.of(context).topBarYouHaveOneReservationToday
          : I18n.of(context).topBarYouHaveReservationsToday(
              homeController.reservationsToday.toString(),
            );

  String getCommunicationsSubTitle(BuildContext context) {
    if (communicationsController.isOnConversationsTab) {
      return communicationsController.unreadConversations == 1
          ? I18n.of(context).topBarYouHaveOneUnreadMessage
          : I18n.of(context).topBarYouHaveUnreadMessages(
              communicationsController.unreadConversations.toString(),
            );
    } else {
      return communicationsController.unreadNotifications == 1
          ? I18n.of(context).topBarYouHaveOneUnreadNotification
          : I18n.of(context).topBarYouHaveUnreadNotifications(
              communicationsController.unreadNotifications.toString(),
            );
    }
  }

  String getSubTitle(BuildContext context) {
    if (homeController.isHomeView) {
      return getHomeViewSubTitle(context);
    }

    if (homeController.isCalendarView) {
      return getCalendarViewSubTitle(context);
    }

    return getCommunicationsSubTitle(context);
  }

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Obx(
          () => Text(
            getSubTitle(context),
            style: TextStyle(color: AppTheme.darkGrey),
          ),
        ),
      );
}

class StylistHomeAppBar {
  static HomeController homeController = Get.find();

  static PreferredSize build() => PreferredSize(
        preferredSize: Size(Get.width, 100),
        child: Container(
          child: Obx(
            () => SafeArea(
              child: Column(
                children: <Widget>[
                  if (homeController.isCalendarView) CalendarAppBar(),
                  if (homeController.isCommunicationsView)
                    CommunicationsAppBar(),
                  if (homeController.isHomeView) DefaultHomeAppBar(),
                  AppBarSubTitle().paddingOnly(top: 10),
                ],
              ).paddingSymmetric(horizontal: 20),
            ),
          ),
        ),
      );
}
