/// -----------------------------------------------------------------
///
/// File: home_controller.dart
/// Project: PUSH
/// File Created: Tuesday, April 13th, 2021
/// Description:
///
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Sunday, April 25th, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/reservation.dart';
import 'package:push_app/app/data/models/shop.dart';
import 'package:push_app/app/data/models/user_file.dart';

enum HomeView {
  Home,
  Calendar,
  Communications,
}

//getting reservations for today, start time end time , and current user
class HomeController extends GetxController {
  // UserRepository userRepository = Get.put(UserRepository());

  String get todayDate => DateFormat('EEEE, MMMM d').format(DateTime.now());
  List<Booth> booths = List<Booth>.generate(
    10,
    (_) => Booth(
      distance: random.decimal(scale: 10).toDouble(),
      shopId: Faker().guid.guid(),
      images: List<UserFile>.generate(
        4,
        (_) => UserFile(
          downloadUrl: Faker().image.image(
            keywords: <String>['barbershop', 'salon'],
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
  );

  List<Reservation> reservations = List<Reservation>.generate(
      10,
      (_) => Reservation(
            startTime:
                DateTime(2021, 4, 22, Faker().randomGenerator.integer(3)),
            endTime: DateTime(
                2021, 4, 22, Faker().randomGenerator.integer(12, min: 4)),
            status: random.element(ReservationStatus.values),
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
            booth: Booth(
              id: Faker().guid.guid(),
              images: List<UserFile>.generate(
                4,
                (_) => UserFile(
                  downloadUrl: Faker().image.image(
                    keywords: <String>['barbershop', 'salon'],
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
          ));

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

  //get reservation query base on today
  //get booths query base on today

  // TODO: Move to reservations controller
  void getReservations() async {
    _reservationsToday.value = 0;
  }
}
