/// -----------------------------------------------------------------
///
/// File: calendar_title_bar_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 21st, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Last Modified: Wednesday, April 21st, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:intl/intl.dart';

// keep track of the selected month and year

// keep track of the number of reservations for the selected date

class CalendarController extends GetxController {
  //ReservationRepository reservationRepository = Get.find();
  Rx<DateTime> _selectedDate;
  DateTime get selectedDate => _selectedDate.value;

  RxString _reservationDate;

  RxInt _reservationAmount;

  String get selectedMonthYear =>
      DateFormat('MMMM yyyy').format(_selectedDate.value);
  String get reservationDate => _reservationDate.value;

  int get reservationAmount => _reservationAmount.value;

  @override
  void onInit() {
    _selectedDate = DateTime.now().obs;
    _reservationDate = DateFormat('MMMM d').format(DateTime.now()).obs;

    _reservationAmount = 0.obs;

    // TODO: implement onInit
    super.onInit();
  }

  void onChangeCalendarPage(bool isChangeToRight) {
    if (isChangeToRight) {
      _selectedDate.value = (selectedDate.month < 12)
          ? DateTime(selectedDate.year, selectedDate.month + 1, 1)
          : DateTime(selectedDate.year + 1, 1, 1);
    } else {
      _selectedDate.value = (selectedDate.month == 1)
          ? DateTime(selectedDate.year - 1, 12, 1)
          : DateTime(selectedDate.year, selectedDate.month - 1, 1);
    }
  }
}
