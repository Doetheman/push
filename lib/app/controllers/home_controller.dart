/// -----------------------------------------------------------------
///
/// File: home_title_bar_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Friday, April 23rd, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';

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
  RxList<FeeType> _exploreNearbyFeeTypes;
  Rx<ReservationAvailabilityType> _exploreNearbyAvailabilityType;
  RxInt exploreNearbyMinHoursAvailable;
  RxInt exploreNearbyMaxHoursAvailable;

  int get reservationsToday => _reservationsToday.value;

  Rx<HomeView> _currentView;
  HomeView get currentView => _currentView.value;
  List<FeeType> get currentFeeTypes => _exploreNearbyFeeTypes.toList();
  ReservationAvailabilityType get currentAvailablity =>
      _exploreNearbyAvailabilityType.value;

  bool get isHomeView => currentView == HomeView.Home;
  bool get isCalendarView => currentView == HomeView.Calendar;
  bool get isCommunicationsView => currentView == HomeView.Communications;
  bool get isAnyTimeThisWeek =>
      currentAvailablity == ReservationAvailabilityType.anytimeThisWeek;
  bool get isToday => currentAvailablity == ReservationAvailabilityType.today;
  bool get isTomorrow =>
      currentAvailablity == ReservationAvailabilityType.tomorrow;

  bool get showAllFeeTypes => currentFeeTypes.length == 3;
  bool get showTwoFeeTypes => currentFeeTypes.length == 2;
  bool get showOneFeeType => currentFeeTypes.length == 1;

  @override
  void onInit() {
    _currentView = HomeView.Home.obs;
    _reservationsToday = 0.obs;
    _exploreNearbyFeeTypes = <FeeType>[
      FeeType.fixed,
      FeeType.commission,
      FeeType.fixedAndCommission,
    ].obs;
    _exploreNearbyAvailabilityType = ReservationAvailabilityType.today.obs;
    exploreNearbyMinHoursAvailable = 4.obs;
    exploreNearbyMaxHoursAvailable = 8.obs;
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

  void onChangeExploreNearbyFeeTypes(List<FeeType> types) {
    _exploreNearbyFeeTypes.assignAll(types);
  }

  void onChangeMinHours(int minHours) {
    exploreNearbyMinHoursAvailable.value = minHours;
  }

  void onChangeMaxHours(int maxHours) {
    exploreNearbyMaxHoursAvailable.value = maxHours;
  }

  // TODO: Move to reservations controller
  void getReservations() async {
    _reservationsToday.value = 0;
  }
}
