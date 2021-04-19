/// -----------------------------------------------------------------
///
/// File: home_title_bar_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 18th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:intl/intl.dart';
import 'package:get/get.dart';

enum HomeView {
  Home,
  Calendar,
  Communications,
}

class HomeController extends GetxController {
  // UserRepository userRepository = Get.put(UserRepository());

  String get todayDate => DateFormat('EEEE, MMMM d').format(DateTime.now());

  // TODO: Move to reservations controller
  RxInt _reservationsToday;
  int get reservationsToday => _reservationsToday.value;

  Rx<HomeView> _currentView;
  HomeView get currentView => _currentView.value;

  bool get isHomeView => currentView == HomeView.Home;
  bool get isCalendarView => currentView == HomeView.Calendar;
  bool get isCommunicationsView => currentView == HomeView.Communications;

  @override
  void onInit() {
    _currentView = HomeView.Home.obs;
    _reservationsToday = 0.obs;
    getReservations();
    super.onInit();
  }

  void onToggleCalendarView() {
    _currentView.value = isCalendarView ? HomeView.Home : HomeView.Calendar;
  }

  void onToggleCommunicationsView() {
    _currentView.value =
        isCommunicationsView ? HomeView.Home : HomeView.Communications;
  }

  // TODO: Move to reservations controller
  void getReservations() async {
    _reservationsToday.value = 0;
  }
}
