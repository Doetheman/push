/// -----------------------------------------------------------------
///
/// File: book_reservation_card_story.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 13th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'package:push_app/app/widgets/stylist_home/book_reservation_card.dart';

class BookReservationCardStory extends Story {
  BookReservationCardStory()
      : super(
          name: 'Book Reservation Card',
          section: 'Stylist Home',
          builder: (BuildContext context, KnobsBuilder knobsBuilder) =>
              BookReservationCard(),
        );
}
