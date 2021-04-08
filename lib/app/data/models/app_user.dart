/// -----------------------------------------------------------------
///
/// File: app_user.dart
/// Project: PUSH
/// File Created: Wednesday, March 17th, 2021
/// Description:
///
/// Author: Luchi - oluchi@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
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

class AppUser extends AppContent {
  AppUser({
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String id,
    String createdBy,
    DocumentSnapshot documentSnapshot,
    this.firstName,
    this.lastName,
    this.email,
    this.lastActiveAt,
    this.type,
    this.images,
    this.profileImage,
  }) : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  AppUser.init({
    this.email,
    String uid,
  }) {
    DateTime now = DateTime.now();
    createdAt = now;
    lastUpdatedAt = now;
    type = UserType.stylist;
    id = uid;
  }

  String firstName;
  String lastName;
  String email;
  DateTime lastActiveAt;
  UserType type;
  List<UserFile> images;
  UserFile profileImage;

  AppUser copyWith({
    String firstName,
    String lastName,
    String email,
    DateTime lastActiveAt,
    UserType type,
    List<UserFile> images,
    UserFile profileImage,
  }) =>
      AppUser(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        lastActiveAt: lastActiveAt ?? this.lastActiveAt,
        type: type ?? this.type,
        profileImage: profileImage ?? this.profileImage,
        images: images ?? this.images,
      );

  AppUser.fromJson(Map<String, dynamic> json, {DocumentReference reference})
      : firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        lastActiveAt = json['lastActiveAt'],
        type = EnumToString.fromString(UserType.values, json['type']),
        profileImage = Is.truthy(json['profileImage'])
            ? UserFile.fromJson(json['profileImage'])
            : null,
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
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'lastActiveAt': lastActiveAt.millisecondsSinceEpoch,
      'type': EnumToString.convertToString(type),
      'profileImage': profileImage?.toJson(),
      'images': images == null
          ? null
          : List<Map<String, dynamic>>.from(
              images.map(
                (UserFile image) => image.toJson(),
              ),
            ),
    });
}
