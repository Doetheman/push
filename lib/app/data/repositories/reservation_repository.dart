/// -----------------------------------------------------------------
///
/// File: reservation_Repository.dart
/// Project: repositories
/// File Created: Sunday, March 28th, 2021
/// Description:
///
/// Author: Oluch Chukwunyere - Oluchi@longsoftware.io
/// -----
/// Last Modified: Monday, April 5th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) <<projectCreationYear>> - 2021 Your Company & <<client>>
///
/// -----------------------------------------------------------------

import 'package:get/get.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/reservation.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/data/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_app/app/utils/is.dart';

class ReservationRepository {
  final FirestoreProvider firestoreProvider = Get.find();
  final AuthProvider authProvider = Get.find();

  CollectionReference get reservationsCollection => firestoreProvider
      .getCollectionReference(FirestoreCollection.RESERVATIONS.value);

  Future<List<dynamic>> getReservations(
    String uid, {
    DateTime minDate,
    DateTime maxDate,
  }) {
    Query query = firestoreProvider.buildQuery(
      collection: reservationsCollection,
      key: 'createdBy',
      value: uid,
      orderBy: 'startTime',
    );

    if (Is.truthy(minDate)) {
      query = firestoreProvider.buildQuery(
        startingQuery: query,
        queryOperator: FirestoreQueryOperator.IS_GREATER_THAN_OR_EQUAL_TO,
        key: 'startTime',
        value: minDate.millisecondsSinceEpoch,
      );
    }

    if (Is.truthy(maxDate)) {
      query = firestoreProvider.buildQuery(
        startingQuery: query,
        queryOperator: FirestoreQueryOperator.IS_LESS_THAN_OR_EQUAL_TO,
        key: 'startTime',
        value: maxDate.millisecondsSinceEpoch,
      );
    }

    return firestoreProvider.queryCollection(startingQuery: query).then(
          (QuerySnapshot querySnapshot) =>
              querySnapshot.docs.map((DocumentSnapshot documentSnapshot) async {
            Reservation reservation =
                Reservation.fromJson(documentSnapshot.data());
            reservation.documentSnapshot = documentSnapshot;
            return reservation;
          }).toList(),
        );
  }

  Future<Reservation> add(Reservation reservation) async {
    reservation.documentReference = await firestoreProvider.createDocument(
      reservationsCollection,
      reservation.toJson(),
    );
    return reservation;
  }

  Future<void> update(Reservation reservation, {bool deleteReservation}) {
    reservation.lastUpdatedAt = DateTime.now();
    return firestoreProvider.updateDocument(
      reservation.documentReference,
      reservation.toJson(),
      delete: deleteReservation,
    );
  }
}
