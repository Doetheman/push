/// -----------------------------------------------------------------
///
/// File: booth_search.dart
/// Project: PUSH
/// File Created: Wednesday, April 21st, 2021
/// Description:
///
/// Author: Courtney Johnson - courtney@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 21st, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

class BoothSearch {
  BoothSearch({
    this.location,
    this.minimumHoursAvailable,
    this.maxHoursAvailable,
    this.minDaysFromNow,
    this.maxDaysFromNow,
  });

  String location;
  int minimumHoursAvailable;
  int maxHoursAvailable;
  int minDaysFromNow;
  int maxDaysFromNow;

  BoothSearch copyWith({
    String location,
    int minimumHoursAvailable,
    int maxHoursAvailable,
    int minDaysFromNow,
    int maxDaysFromNow,
  }) =>
      BoothSearch(
        location: location ?? this.location,
        minimumHoursAvailable:
            minimumHoursAvailable ?? this.minimumHoursAvailable,
        maxHoursAvailable: maxHoursAvailable ?? this.maxHoursAvailable,
        minDaysFromNow: minDaysFromNow ?? this.minDaysFromNow,
        maxDaysFromNow: maxDaysFromNow ?? this.maxDaysFromNow,
      );

  factory BoothSearch.fromJson(Map<String, dynamic> json) => BoothSearch(
        location: json['location'] ?? '',
        minimumHoursAvailable: json['minimumHoursAvailable'] ?? 0,
        maxHoursAvailable: json['maxHoursAvailable'] ?? 0,
        minDaysFromNow: json['minDaysFromNow'] ?? 0,
        maxDaysFromNow: json['maxDaysFromNow'] ?? 0,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'location': location ?? '',
        'minimumHoursAvailable': minimumHoursAvailable ?? 0,
        'maxHoursAvailable': maxHoursAvailable ?? 0,
        'minDaysFromNow': minDaysFromNow ?? 0,
        'maxDaysFromNow': maxDaysFromNow ?? 0,
      };
}
