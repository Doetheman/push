/// -----------------------------------------------------------------
///
/// File: stylist_home_page.dart
/// Project: PUSH
/// File Created: Saturday, March 20th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_app/app/controllers/home_controller.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/widgets/misc/bottom_nav_bar.dart';
import 'package:push_app/app/widgets/stylist_home/booth_carousel_card.dart';
import 'package:push_app/app/widgets/stylist_home/explore_nearby_header.dart';
import 'package:push_app/app/widgets/stylist_home/reservation_card.dart';
import 'package:push_app/app/widgets/stylist_home/stylist_home_app_bar.dart';

class StylistHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();

    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StylistHomeAppBar.build().paddingOnly(bottom: 13),
            Container(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (_, __) => SizedBox(
                  width: 10,
                ),
                itemCount: controller.reservations.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (BuildContext context, int index) =>
                    ReservationCard(
                  reservation: controller.reservations[index],
                  cardView: CardView.carousel,
                ),
              ),
            ),
            ExploreNearbyHeader().paddingAll(20),
            ...controller.booths.map(
              (Booth booth) =>
                  BoothCarouselCard(booth: booth).paddingOnly(bottom: 10),
            ),
          ],
        ).paddingSymmetric(vertical: 20),
      )),
    );
  }
}
