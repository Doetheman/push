/// -----------------------------------------------------------------
///
/// File: court.dart
/// Project: PUSH
/// File Created: Tuesday, March 16th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Thursday, March 18th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH
///
/// -----------------------------------------------------------------

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'app_content.dart';

class Booth extends AppContent {
  Booth({
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String id,
    String createdBy,
    this.outletsAvailable,
    this.hvac,
    this.price,
    this.shopId,
    this.images,
  }) : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  int outletsAvailable;
  bool hvac;
  int price; // in cents
  List<UserFile> images;
  String shopId;

  Booth copyWith({
    int outletsAvailable,
    bool hvac,
    String price,
    List<UserFile> images,
    String shopId,
  }) =>
      Booth(
        outletsAvailable: outletsAvailable ?? this.outletsAvailable,
        hvac: hvac ?? this.hvac,
        price: price ?? this.price,
        shopId: shopId ?? this.shopId,
        createdAt: createdAt,
        lastUpdatedAt: lastUpdatedAt,
        id: id,
        createdBy: createdBy,
      );

  Booth.fromJson(Map<String, dynamic> json, {DocumentReference reference})
      : outletsAvailable = json['outletsAvailable'] ?? false,
        hvac = json['hvac'],
        price = json['price'] ?? 0,
        shopId = json['shopId'],
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
        'hvac': hvac,
        'price': price,
        'shopId': shopId,
        'images': images == null
            ? null
            : List<Map<String, dynamic>>.from(
                images.map(
                  (UserFile image) => image.toJson(),
                ),
              ),
      };
}
