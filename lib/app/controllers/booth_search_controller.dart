/// -----------------------------------------------------------------
///
/// File: booth_search_controller.dart
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

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/booth_search.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/shop.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/utils/is.dart';

class BoothSearchController extends GetxController {
  RxString searchText;
  bool get isEmpty => Is.emptyOrNull(searchText.value);

  RxBool _isEnteringSearchText;
  bool get isEnteringSearchText => _isEnteringSearchText.value;
  RxList<Booth> _booths;

  List<Booth> get booths => (_booths);

  int get countBooth => (_booths.length);

  TextEditingController searchBarTextController;

  List<BoothSearch> recentSearches = List<BoothSearch>.generate(
    3,
    (int index) => BoothSearch(
      location: Faker().address.city() + '  NC',
      minimumHoursAvailable: random.integer(10),
      maxHoursAvailable: random.integer(40, min: 11),
      minDaysFromNow: random.integer(14),
    ),
  );
  List<String> areasNear =
      List<String>.generate(6, (int index) => Faker().address.city() + '  NC');

  @override
  void onInit() {
    searchText = ''.obs;
    _isEnteringSearchText = true.obs;
    _booths = List<Booth>.generate(
      10,
      (_) => Booth(
        distance: random.decimal(scale: 10).toDouble(),
        shopId: Faker().guid.guid(),
        images: List<UserFile>.generate(
          4,
          (_) => UserFile(
            downloadUrl: Faker().image.image(
              keywords: <String>['barbershop', 'salon', 'hair'],
            ),
          ),
        ),
        boothName: Faker().lorem.word(),
        averageRating: random.decimal(scale: 5, min: 0),
        price: random.integer(50),
        feeType: random.element(FeeType.values),
        specialties: List<Specialties>.generate(
          3,
          (_) => random.element(Specialties.values),
        ),
        shop: Shop(
            name: Faker().company.name(),
            images: List<UserFile>.generate(
              4,
              (_) => UserFile(
                downloadUrl: Faker().image.image(
                  keywords: <String>['barbershop', 'salon'],
                ),
              ),
            ),
            address: Faker().address.streetName()),
      ),
    ).obs;

    searchBarTextController = TextEditingController();
    super.onInit();
  }

  void onChangeSearchText(String name) {
    searchText.value = name?.trim();
  }

  void onSelectLocation(String location) {
    // TODO: switch to specialty selection

    _isEnteringSearchText.value = false;
  }

  void clearText() {
    searchBarTextController.clear();
    searchText.value = '';
  }
}
