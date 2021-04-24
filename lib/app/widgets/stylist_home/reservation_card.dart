/// -----------------------------------------------------------------
///
/// File: reservation_card.dart
/// Project: PUSH
/// File Created: Thursday, April 22nd, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Saturday, April 24th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:push_app/app/utils/indexer.dart';
import 'package:push_app/app/widgets/misc/image_wrapper.dart';
import 'package:push_app/generated/i18n.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/reservation.dart';
import 'package:push_app/app/theme/app_theme.dart';
import 'package:push_app/assets/icons/svgs.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  final CardView cardView;

  bool get isCarouselView => cardView == CardView.carousel;
  bool get isFullWidthView => cardView == CardView.fullWidth;

  String get statusIcon {
    switch (reservation.status) {
      case ReservationStatus.confirmed:
        return CONFIRMED_STATUS_ICON;
      case ReservationStatus.cancelled:
        return CANCELLED_STATUS_ICON;
      case ReservationStatus.pending:
        return PENDING_STATUS_ICON;
      case ReservationStatus.complete:
        return COMPLETE_STATUS_ICON;
      default:
        return '';
    }
  }

  ReservationCard({
    Key key,
    this.reservation,
    this.cardView,
  }) : super(key: key);

  Text buildStartAndEndTime() => Text(
        DateFormat('h a').format(reservation.startTime) +
            ' - ' +
            DateFormat('h a').format(reservation.endTime),
        style: AppTheme.headlineThree,
      );

  Text buildShopName() => Text(
        reservation.shop.name,
        style: AppTheme.bodyOne.copyWith(color: AppTheme.darkGrey),
      );

  Text buildShopAddress() => Text(
        reservation.shop.address,
        softWrap: true,
        style: AppTheme.bodyTwo.copyWith(color: AppTheme.darkGrey),
      );

  Text buildStatusText(BuildContext context) {
    switch (reservation.status) {
      case ReservationStatus.confirmed:
        return Text(
          I18n.of(context).reservationStatusConfirmed.toUpperCase(),
          style: AppTheme.subtitleTwo.copyWith(color: AppTheme.primaryGreen),
        );
      case ReservationStatus.cancelled:
        return Text(
          I18n.of(context).reservationStatusCancelled.toUpperCase(),
          style: AppTheme.subtitleTwo.copyWith(color: AppTheme.primaryRed),
        );
      case ReservationStatus.pending:
        return Text(
          I18n.of(context).reservationStatusPending.toUpperCase(),
          style: AppTheme.subtitleTwo.copyWith(color: AppTheme.yellow),
        );
      case ReservationStatus.complete:
        return Text(
          I18n.of(context).reservationStatusComplete.toUpperCase(),
          style: AppTheme.subtitleTwo.copyWith(color: AppTheme.primaryGreen),
        );
      default:
        return Text('');
    }
  }

  Widget buildStatus(BuildContext context) => Row(
        children: <Widget>[
          SvgPicture.asset(statusIcon, height: 12, width: 12),
          buildStatusText(context).paddingOnly(left: 6),
        ],
      );

  Text buildBoothName(BuildContext context) => Text(
        I18n.of(context).commonBoothName(reservation.booth.boothName),
        style: AppTheme.bodyTwo.copyWith(color: AppTheme.darkGrey),
      );

  @override
  Widget build(BuildContext context) => Container(
        width: isCarouselView ? 335 : Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (isCarouselView)
              ImageWrapper(
                width: 150,
                height: 150,
                file: Indexer.getListIndex(reservation.shop.images, 0),
              ).paddingOnly(right: 15),
            if (isCarouselView)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildStatus(context),
                  buildStartAndEndTime().paddingOnly(top: 8),
                  buildShopName(),
                  buildBoothName(context),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(SHOP_LOCATION_ICON)
                          .paddingOnly(right: 10),
                      Container(
                        width: 115,
                        child: buildShopAddress(),
                      ),
                    ],
                  ).paddingOnly(top: 14),
                ],
              ).paddingOnly(top: 10),
            if (isFullWidthView)
              ImageWrapper(
                width: 90,
                height: 90,
                file: Indexer.getListIndex(reservation.shop.images, 0),
              ).paddingOnly(right: 15),
            if (isFullWidthView)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildStatus(context).paddingSymmetric(vertical: 5),
                  buildStartAndEndTime(),
                  buildShopName(),
                  buildShopAddress(),
                ],
              ),
            if (isFullWidthView) Spacer(),
            if (isFullWidthView)
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  SHOP_MESSAGE_ICON,
                ),
              )
          ],
        ),
      );
}
