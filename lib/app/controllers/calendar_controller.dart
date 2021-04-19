/// -----------------------------------------------------------------
///
/// File: calendar_title_bar_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 18th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// Last Modified: Sunday, April 18th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:intl/intl.dart';

// keep track of the selected month and year

// keep track of the number of reservations for the selected date

class CalendarController extends GetxController {
  //ReservationRepository reservationRepository = Get.find();
  RxString _selectedDate;
  RxString _reservationDate;

  RxInt _reservationAmount;

  String get selectedDate => _selectedDate.value;
  String get reservationDate => _reservationDate.value;

  int get reservationAmount => _reservationAmount.value;

  @override
  void onInit() {
    _selectedDate = DateFormat('MMMM yyyy').format(DateTime.now()).obs;
    _reservationDate = DateFormat('MMMM d').format(DateTime.now()).obs;

    _reservationAmount = 0.obs;

    // TODO: implement onInit
    super.onInit();
  }
}
