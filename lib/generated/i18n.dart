import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "Stylist"
  String get commonStylist => "Stylist";
  /// "Shop Owner"
  String get commonShopOwner => "Shop Owner";
  /// "Revenue"
  String get commonRevenue => "Revenue";
  /// "Costs"
  String get commonCosts => "Costs";
  /// "Messages"
  String get commonMessages => "Messages";
  /// "Notifications"
  String get commonNotifications => "Notifications";
  /// "Yes"
  String get commonYes => "Yes";
  /// "No"
  String get commonNo => "No";
  /// "State"
  String get commonState => "State";
  /// " and "
  String get commonAnd => " and ";
  /// "Booth: ${name}"
  String commonBoothName(String name) => "Booth: ${name}";
  /// "Reserve"
  String get commonReserve => "Reserve";
  /// "Password"
  String get commonPassword => "Password";
  /// "Reserve a space to operate your business from any salon in the world."
  String get userTypeCardStylistBody => "Reserve a space to operate your business from any salon in the world.";
  /// "Manage each booth or space within your shop individually."
  String get userTypeCardShopOwnerBody => "Manage each booth or space within your shop individually.";
  /// "Fixed"
  String get feeTypesFixed => "Fixed";
  /// "Commission"
  String get feeTypesCommission => "Commission";
  /// "Fixed + Commission"
  String get feeTypesFixedAndCommission => "Fixed + Commission";
  /// "There are three types of fees that a reservation may have."
  String get feeTypesHeaderTitle => "There are three types of fees that a reservation may have.";
  /// "Find a spot with the pricing model that works best for your business!"
  String get feeTypesHeaderSubtitle => "Find a spot with the pricing model that works best for your business!";
  /// "Pay a set rate for a set period of time"
  String get feeTypesDescriptionFixedBody => "Pay a set rate for a set period of time";
  /// "Ex: \$35 per day"
  String get feeTypesDescriptionFixedExample => "Ex: \$35 per day";
  /// "Pay a set percentage of your revenue to the shop"
  String get feeTypesDescriptionCommissionBody => "Pay a set percentage of your revenue to the shop";
  /// "Ex: 20% per transaction"
  String get feeTypesDescriptionCommissionExample => "Ex: 20% per transaction";
  /// "Pay a set minimum rate that increases with sales"
  String get feeTypesDescriptionFixedAndCommissionBody => "Pay a set minimum rate that increases with sales";
  /// "Ex: \$15 per day + 5% per transaction"
  String get feeTypesDescriptionFixedAndCommissionExample => "Ex: \$15 per day + 5% per transaction";
  /// "Book your first reservation"
  String get bookReservationCardTitle => "Book your first reservation";
  /// "Find an available booth for your specialization anywhere in the country."
  String get bookReservationCardBody => "Find an available booth for your specialization anywhere in the country.";
  /// "You have ${number} reservations on ${date}."
  String topBarYouHaveReservationsOn(String number, String date) => "You have ${number} reservations on ${date}.";
  /// "You have 1 reservation on ${date}."
  String topBarYouHaveOneReservationOn(String date) => "You have 1 reservation on ${date}.";
  /// "You have ${number} reservations today."
  String topBarYouHaveReservationsToday(String number) => "You have ${number} reservations today.";
  /// "You have 1 reservation today."
  String get topBarYouHaveOneReservationToday => "You have 1 reservation today.";
  /// "You have ${number} unread messages."
  String topBarYouHaveUnreadMessages(String number) => "You have ${number} unread messages.";
  /// "You have 1 unread message."
  String get topBarYouHaveOneUnreadMessage => "You have 1 unread message.";
  /// "You have ${number} unread notifications"
  String topBarYouHaveUnreadNotifications(String number) => "You have ${number} unread notifications";
  /// "You have 1 unread notification."
  String get topBarYouHaveOneUnreadNotification => "You have 1 unread notification.";
  /// "Are you licensed by a state board for barbers and cosmetology."
  String get stylistBasicInfoInputAreYouLicensed => "Are you licensed by a state board for barbers and cosmetology.";
  /// "Full Name"
  String get stylistBasicInfoInputFullName => "Full Name";
  /// "Primary Location"
  String get stylistBasicInfoInputPrimaryLocation => "Primary Location";
  /// "${minHours} - ${maxHours} hours within the next day"
  String recentSearchListItemOneDayRange(String minHours, String maxHours) => "${minHours} - ${maxHours} hours within the next day";
  /// "${minHours} - ${maxHours} hours within the next ${days} days"
  String recentSearchListItemMultiDayRange(String minHours, String maxHours, String days) => "${minHours} - ${maxHours} hours within the next ${days} days";
  /// "Where do you want to style?"
  String get searchBarHintText => "Where do you want to style?";
  /// "Select all that apply"
  String get specialtyMultiSelectSelectAll => "Select all that apply";
  /// "Explore nearby"
  String get exploreNearbyTitle => "Explore nearby";
  /// "Showing booths based on your specialties that are available "
  String get exploreNearbyBody => "Showing booths based on your specialties that are available ";
  /// "${availabilityType} "
  String exploreNearbyAvailability(String availabilityType) => "${availabilityType} ";
  /// "any time next week "
  String get exploreNearbyAnyTimeNextWeek => "any time next week ";
  /// "for "
  String get exploreNearbyFor => "for ";
  /// "${minHours}-${maxHours} hours "
  String exploreNearbyMinMaxHours(String minHours, String maxHours) => "${minHours}-${maxHours} hours ";
  /// "with "
  String get exploreNearbyWith => "with ";
  /// " fee type"
  String get exploreNearbyFeeType => " fee type";
  /// "any"
  String get exploreNearbyAny => "any";
  /// "Confirmation Pending"
  String get reservationStatusPending => "Confirmation Pending";
  /// "Confirmed"
  String get reservationStatusConfirmed => "Confirmed";
  /// "Cancelled"
  String get reservationStatusCancelled => "Cancelled";
  /// "complete"
  String get reservationStatusComplete => "complete";
  /// "\$${price}/hour"
  String boothCarouselCardPrice(String price) => "\$${price}/hour";
  /// "Continue"
  String get signUpPageContinue => "Continue";
  /// "Select your specialties"
  String get signUpPageSpecialties => "Select your specialties";
  /// "Start Styling"
  String get signUpPageStartStyling => "Start Styling";
  /// "Sign Up"
  String get signUpPageSignUp => "Sign Up";
  /// "We connect top stylists and shops anywhere in the world"
  String get emailInputInputHeader => "We connect top stylists and shops anywhere in the world";
  /// "Enter your email to get started"
  String get emailInputInputSubtitle => "Enter your email to get started";
  /// "Email Address"
  String get emailInputPlaceHolder => "Email Address";
  /// "Create a password"
  String get emailInputNewPassword => "Create a password";
  /// "Enter your password"
  String get emailInputExistingPassword => "Enter your password";
  /// "RECENT SEARCHES"
  String get boothSearchInputRecentSearches => "RECENT SEARCHES";
  /// "AREAS NEAR YOU"
  String get boothSearchInputAreasNearYou => "AREAS NEAR YOU";
  /// "LOCATIONS"
  String get boothSearchInputLocations => "LOCATIONS";
  /// "Current Location"
  String get currentLocationCurrentLocation => "Current Location";
  /// "${booths} booths available"
  String boothsAvailableBoothsAvailable(String booths) => "${booths} booths available";
  /// "${startHour} - ${endHour}"
  String hourSelectionButtonSelectionTime(String startHour, String endHour) => "${startHour} - ${endHour}";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}