/// -----------------------------------------------------------------
///
/// File: reservation.dart
/// Project: PUSH
/// File Created: Sunday, March 21th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@Longsoftware.io
/// -----
/// Last Modified: Thursday, April 22nd, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_app/app/data/models/shop.dart';
import 'app_content.dart';
import 'booth.dart';
import 'enums.dart';

class Reservation extends AppContent {
  Reservation({
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String id,
    String createdBy,
    this.startTime,
    this.endTime,
    this.reservationFee,
    this.status,
    this.booth,
    this.shop,
    this.transactionId,
    this.boothId,
    this.shopId,
  }) : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  DateTime startTime;
  DateTime endTime;
  int reservationFee;
  String transactionId;
  String boothId;
  String shopId;
  ReservationStatus status;
  Booth booth;
  Shop shop;

  Reservation copyWith({
    DateTime startTime,
    DateTime endTime,
    int reservationFee,
    String transactionId,
    String boothId,
    String shopId,
  }) =>
      Reservation(
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        reservationFee: reservationFee ?? this.reservationFee,
        transactionId: transactionId ?? this.transactionId,
        shopId: shopId ?? this.shopId,
        boothId: boothId ?? this.boothId,
      );

  Reservation.fromJson(Map<String, dynamic> json, {DocumentReference reference})
      : startTime = json['startTime'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['startTime']),
        endTime = json['endTime'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['endTime']),
        reservationFee = json['reservationFee'] ?? 0,
        transactionId = json['transactionId'],
        shopId = json['shopId'],
        boothId = json['boothId'],
        super.fromJson(json, reference: reference);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'startTime': startTime?.millisecondsSinceEpoch,
        'endTime': endTime?.millisecondsSinceEpoch,
        'reservationFee': reservationFee,
        'transactionId': transactionId,
        'boothId': boothId,
        'shopId': shopId,
      };
}
