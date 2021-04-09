/// -----------------------------------------------------------------
///
/// File: shop.dart
/// Project: PUSH
/// File Created: Tuesday, March 16th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Friday, April 9th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'app_content.dart';

class Shop extends AppContent {
  Shop({
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String id,
    String createdBy,
    this.name,
    this.address,
    this.website,
    this.number,
    this.verified,
    this.hoursOfOperation,
    this.images,
  }) : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  String name;
  String address;
  String website;
  String number;
  bool verified;
  List<HoursOfOperation> hoursOfOperation;
  List<UserFile> images;

  Shop copyWith({
    String name,
    String address,
    String website,
    String number,
    bool verified,
    List<HoursOfOperation> hoursOfOperation,
    List<UserFile> images,
  }) =>
      Shop(
        name: name ?? this.name,
        address: address ?? this.address,
        website: website ?? this.website,
        number: number ?? this.number,
        verified: verified ?? this.verified,
        hoursOfOperation: hoursOfOperation ?? this.hoursOfOperation,
        images: images ?? this.images,
        createdAt: createdAt,
        lastUpdatedAt: lastUpdatedAt,
        id: id,
        createdBy: createdBy,
      );

  Shop.fromJson(Map<String, dynamic> json, {DocumentReference reference})
      : name = json['name'],
        address = json['address'],
        website = json['website'],
        number = json['number'],
        verified = json['verified'] ?? false,
        hoursOfOperation = json['hoursOfOperation'] == null
            ? null
            : List<HoursOfOperation>.from(
                json['hoursOfOperation'].map(
                  (Map<String, dynamic> hoursJson) =>
                      HoursOfOperation.fromJson(hoursJson),
                ),
              ),
        images = json['images'] == null
            ? null
            : List<UserFile>.from(
                json['images'].map(
                  (Map<String, dynamic> imageJson) =>
                      UserFile.fromJson(imageJson),
                ),
              ),
        super.fromJson(json, reference: reference);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'name': name,
      'address': address,
      'website': website,
      'number': number,
      'verified': verified,
      'hoursOfOperation': hoursOfOperation == null
          ? null
          : List<Map<String, dynamic>>.from(
              hoursOfOperation.map(
                (HoursOfOperation hours) => hours.toJson(),
              ),
            ),
      'images': images == null
          ? null
          : List<Map<String, dynamic>>.from(
              images.map(
                (UserFile image) => image.toJson(),
              ),
            ),
    });
}

class HoursOfOperation {
  HoursOfOperation({
    this.indexOfDay,
    this.openHour,
    this.openMinute,
    this.closeHour,
    this.closeMinute,
    this.isOpen,
  });

  int indexOfDay;
  int openHour;
  int openMinute;
  int closeHour;
  int closeMinute;
  bool isOpen;

  HoursOfOperation copyWith({
    int indexOfDay,
    int openHour,
    int openMinute,
    int closeHour,
    int closeMinute,
    bool isOpen,
  }) =>
      HoursOfOperation(
        indexOfDay: indexOfDay ?? this.indexOfDay,
        openHour: openHour ?? this.openHour,
        openMinute: openMinute ?? this.openMinute,
        closeHour: closeHour ?? this.closeHour,
        closeMinute: closeMinute ?? this.closeMinute,
        isOpen: isOpen ?? this.isOpen,
      );

  factory HoursOfOperation.fromJson(Map<String, dynamic> json) =>
      HoursOfOperation(
        indexOfDay: json['indexOfDay'],
        openHour: json['openHour'],
        openMinute: json['openMinute'],
        closeHour: json['closeHour'],
        closeMinute: json['closeMinute'],
        isOpen: json['isOpen'] ?? false,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'indexOfDay': indexOfDay,
        'openHour': openHour,
        'openMinute': openMinute,
        'closeHour': closeHour,
        'closeMinute': closeMinute,
        'isOpen': isOpen,
      };
}
