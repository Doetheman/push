import 'package:push_app/app/data/providers/firestore_provider.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/data/models/booth.dart';
import 'package:push_app/app/data/models/algolia_query_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_app/app/data/repositories/booth_repository.dart';

class MockBoothRepository implements BoothRepository {
  @override
  Future<Booth> add(Booth booth) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  // TODO: implement authProvider
  AuthProvider get authProvider => throw UnimplementedError();

  @override
  // TODO: implement boothsCollection
  CollectionReference get boothsCollection => throw UnimplementedError();

  @override
  // TODO: implement firestoreProvider
  FirestoreProvider get firestoreProvider => throw UnimplementedError();

  // @override
  // Future<AlgoliaQueryResult> getAllBooths({String query, int page}) {
  //  // return AlgoliaQueryResult(<AlgoliaQuerySnapshot>.generate(10, (_) => AlgoliaQuerySnapshot(
  //   // AlgoliaQueryResult(<AlgoliaQuerySnapshot>)

  //  List<Booth>.generate(10, (_) => Booth(
  //   id: Faker().guid.guid(),
  //   images: List<UserFile>.generate(
  //       4,
  //       (_) => UserFile(
  //         downloadUrl: Faker().image.image(
  //           keywords: <String>['barbershop', 'salon'],
  //         ),
  //       ),
  //     ),
  //   boothName: Faker().lorem.word(),
  //   averageRating: random.decimal(scale:5,min:0),
  //   price: random.integer(50),
  //   feeType: random.element(FeeType.values),
  //   specialties: List<Specialties>.generate(3, (_) => random.element(Specialties.values),
  //   ),
  //   shop: Shop(
  //     name: Faker().company.name(),
  //     images: List<UserFile>.generate(
  //       4,
  //       (_) => UserFile(
  //         downloadUrl: Faker().image.image(
  //           keywords: <String>['barbershop', 'salon'],
  //         ),
  //       ),
  //     ),
  //     address: Faker().address.streetName()),
  //   ),
  //  );
  // };

  @override
  Future<void> update(Booth booth, {bool deleteBooth}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<AlgoliaQueryResult> getAllBooths({String query, int page}) {
    // TODO: implement getAllBooths
    throw UnimplementedError();
  }
}
