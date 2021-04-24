/// -----------------------------------------------------------------
///
/// File: reservation_card_story.dart
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

import 'package:faker/faker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/reservation.dart';
import 'package:push_app/app/data/models/shop.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/widgets/stylist_home/reservation_card.dart';
import 'package:push_app/storybook/mocks/providers/mock_auth_provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ReservationCardStory extends Story {
  ReservationCardStory()
      : super(
            name: 'Reservation Card',
            section: 'Stylist Home',
            builder: (BuildContext context, KnobsBuilder knobsBuilder) {
              Get.put<BaseAuthProvider>(MockAuthProvider());
              Shop shop = Shop(
                address: '123 Main St Richmond, VA',
                name: 'Cuts n’ Styles',
                images: <UserFile>[
                  UserFile(
                    downloadUrl: Faker().image.image(
                      keywords: <String>['barbershop', 'salon'],
                    ),
                  ),
                ],
              );

              Booth booth = Booth(
                boothName: '#12',
              );

              Reservation reservation = Reservation(
                startTime: DateTime(4, 22, 10, 13),
                endTime: DateTime(2021, 4, 22, 12, 13),
                status: knobsBuilder.options(
                  label: 'Status',
                  initial: ReservationStatus.cancelled,
                  options: <Option<ReservationStatus>>[
                    Option<ReservationStatus>(
                        'Cancelled', ReservationStatus.cancelled),
                    Option<ReservationStatus>(
                        'Confirmed', ReservationStatus.confirmed),
                    Option<ReservationStatus>(
                        'Pending', ReservationStatus.pending),
                    Option<ReservationStatus>(
                        'Complete', ReservationStatus.complete)
                  ],
                ),
                shop: shop,
                booth: booth,
              );

              return Container(
                child: ReservationCard(
                  reservation: reservation,
                  cardView: knobsBuilder.options(
                    label: 'CardView',
                    initial: CardView.carousel,
                    options: <Option<CardView>>[
                      Option<CardView>('Full Width', CardView.fullWidth),
                      Option<CardView>('Carousel', CardView.carousel),
                    ],
                  ),
                ),
              );
            });
}
