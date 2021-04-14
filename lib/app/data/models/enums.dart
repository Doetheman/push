/// -----------------------------------------------------------------
///
/// File: enums.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Tuesday, April 13th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

// ignore_for_file: always_specify_types
// ignore_for_file: unnecessary_const
class Enum<T> {
  final T _value;
  const Enum(this._value);
  dynamic get value => _value;
  @override
  String toString() => '$value';
}

class FirestoreQueryOperator<String> extends Enum<String> {
  const FirestoreQueryOperator(String val) : super(val);
  static const FirestoreQueryOperator IS_EQUAL_TO =
      const FirestoreQueryOperator('==');
  static const FirestoreQueryOperator IS_LESS_THAN =
      const FirestoreQueryOperator('<');
  static const FirestoreQueryOperator IS_LESS_THAN_OR_EQUAL_TO =
      const FirestoreQueryOperator('<=');
  static const FirestoreQueryOperator IS_GREATER_THAN =
      const FirestoreQueryOperator('>');
  static const FirestoreQueryOperator IS_GREATER_THAN_OR_EQUAL_TO =
      const FirestoreQueryOperator('>=');
  static const FirestoreQueryOperator ARRAY_CONTAINS =
      const FirestoreQueryOperator('array-contains');
  static const FirestoreQueryOperator ARRAY_CONTAINS_ANY =
      const FirestoreQueryOperator('array-contains-any');
  static const FirestoreQueryOperator IS_NULL =
      const FirestoreQueryOperator('isNull');
  static const FirestoreQueryOperator WHERE_IN =
      const FirestoreQueryOperator('in');
}

class FirestoreCollection<String> extends Enum<String> {
  const FirestoreCollection(String val) : super(val);
  static const FirestoreCollection USERS = const FirestoreCollection('users');
  static const FirestoreCollection NOTIFICATIONS =
      const FirestoreCollection('notifications');
  static const FirestoreCollection CONVERSATIONS =
      const FirestoreCollection('conversations');
  static const FirestoreCollection SHOPS = const FirestoreCollection('shops');
  static const FirestoreCollection BOOTHS = const FirestoreCollection('booths');
  static const FirestoreCollection MESSAGES =
      const FirestoreCollection('messages');
  static const FirestoreCollection RESERVATIONS =
      const FirestoreCollection('reservations');
}

enum UserFileType {
  image,
  pdf,
}

enum NotificationRecipientsOption {
  all,
  stylists,
  owners,
}

enum UserType {
  admin,
  stylist,
  owner,
}

enum Specialties {
  barbering,
  hairStyling,
  nailTechnichian,
  braiding,
  makeup,
  waxing,
  tattooing,
  piercing,
  hairColoring,
  esthetics,
}

enum FeeType {
  fixed,
  commission,
  fixedAndCommission,
}
