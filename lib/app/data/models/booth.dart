/// -----------------------------------------------------------------
///
/// File: court.dart
/// Project: PUSH
/// File Created: Tuesday, March 16th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Friday, April 23rd, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/utils/is.dart';
import 'app_content.dart';

class Booth extends AppContent {
  Booth({
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String id,
    String createdBy,
    this.outletsAvailable,
    this.hasHVAC,
    this.price,
    this.shopId,
    this.images,
    this.specialties,
    this.boothName,
  }) : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  bool outletsAvailable;
  bool hasHVAC;
  int price; // in cents
  List<UserFile> images;
  String shopId;
  List<Specialties> specialties;
  double ratings;
  String boothName;

  Booth copyWith(
          {int outletsAvailable,
          bool hasHVAC,
          String price,
          List<UserFile> images,
          String shopId,
          List<Specialties> specialties}) =>
      Booth(
        outletsAvailable: outletsAvailable ?? this.outletsAvailable,
        hasHVAC: hasHVAC ?? this.hasHVAC,
        price: price ?? this.price,
        shopId: shopId ?? this.shopId,
        specialties: specialties ?? this.specialties,
        createdAt: createdAt,
        lastUpdatedAt: lastUpdatedAt,
        id: id,
        createdBy: createdBy,
      );

  Booth.fromJson(Map<String, dynamic> json, {DocumentReference reference})
      : outletsAvailable = json['outletsAvailable'] ?? false,
        hasHVAC = json['hasHVAC'] ?? false,
        price = json['price'] ?? 0,
        shopId = json['shopId'],
        specialties = Is.truthy(json['specialties'])
            ? json['specialties'].map(
                (dynamic specialty) =>
                    EnumToString.fromString(Specialties.values, specialty),
              )
            : <Specialties>[],
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
  Map<String, dynamic> toJson() => <String, dynamic>{
        'outletsAvailable': outletsAvailable,
        'hvac': hasHVAC,
        'price': price,
        'shopId': shopId,
        'specialties': specialties?.map(
          (Specialties specialty) => EnumToString.convertToString(specialty),
        ),
        'images': images == null
            ? null
            : List<Map<String, dynamic>>.from(
                images.map(
                  (UserFile image) => image.toJson(),
                ),
              ),
      };
}
