/// -----------------------------------------------------------------
///
/// File: user_repository.dart
/// Project: PUSH
/// File Created: Saturday, March 27th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/algolia_query_result.dart';
import 'package:push_app/app/data/models/app_user.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/models/user_file.dart';
import 'package:push_app/app/data/providers/algolia_provider.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/data/providers/firestore_provider.dart';
import 'package:push_app/app/data/providers/storage_provider.dart';
import 'package:push_app/app/utils/is.dart';

class UserRepository {
  final AuthProvider authProvider = Get.find();
  final FirestoreProvider firestoreProvider = Get.find();
  final AlgoliaProvider algoliaProvider = Get.find();
  final StorageProvider storageProvider = Get.find();

  String get currentUserId => authProvider.currentUid;
  bool get isLoggedIn => authProvider.isLoggedIn;

  Stream<User> get onAuthStateChanged => authProvider.auth.authStateChanges();

  CollectionReference get usersCollection =>
      firestoreProvider.getCollectionReference(FirestoreCollection.USERS.value);

  Future<void> signOut() => authProvider.signOut();

  void deleteImages(List<UserFile> images) {
    images.forEach((UserFile image) async {
      await storageProvider.deleteFile(image.storagePath);
    });
  }

  Future<UserFile> uploadImage(UserFile file) async {
    DateTime now = DateTime.now();

    String fileName = 'user_profile_image_${now.microsecondsSinceEpoch}.jpg';
    String storagePath = FirestoreCollection.USERS.toString() +
        '/' +
        authProvider.currentUid +
        '/$fileName';

    String url = await storageProvider.uploadFile(
      storagePath,
      await file.data.readAsBytes(),
    );

    file.downloadUrl = url;
    file.storagePath = storagePath;
    file.name = 'Profile Image';
    file.altText = 'Profile Image';

    file.data = null;

    return file;
  }

  Future<AppUser> uploadImages(AppUser user) async {
    if (Is.truthy(user.images)) {
      for (int i = 0; i < user.images.length; i++) {
        if (Is.truthy(user.images[i].data)) {
          user.images[i] = await uploadImage(user.images[i]);
        }
      }
    }
    return user;
  }

  Future<void> update(AppUser user) async {
    user.lastUpdatedAt = DateTime.now();

    if (Is.truthy(user.profileImage?.data)) {
      user.profileImage = await uploadImage(user.profileImage);
    }

    user = await uploadImages(user);

    return firestoreProvider.updateDocument(
      user.documentReference,
      user.toJson(),
    );
  }

  Future<void> deleteUser() async {
    await firestoreProvider
        .updateDocument(usersCollection.doc(currentUserId), null, delete: true);

    return authProvider.currentUser().delete();
  }

  Future<AppUser> getByUid(String uid) async {
    DocumentSnapshot snapshot = await firestoreProvider.getDocumentSnapshot(
      usersCollection,
      uid,
    );

    if (Is.falsy(snapshot?.data()) || !snapshot.exists) {
      return null;
    }
    return AppUser.fromJson(snapshot.data(), reference: snapshot.reference);
  }

  Future<AppUser> _createUser(User firebaseUser) async {
    AppUser user = AppUser.init(
      email: firebaseUser.email,
      uid: firebaseUser.uid,
    );

    user.documentReference = await firestoreProvider.createDocument(
      usersCollection,
      user.toJson(),
      documentId: firebaseUser.uid,
    );

    return user;
  }

  Future<AppUser> createNewUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User firebaseUser =
        await authProvider.createNewUserWithEmailAndPassword(email, password);

    return _createUser(firebaseUser);
  }

  Future<AppUser> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User firebaseUser =
        await authProvider.signInWithEmailAndPassword(email, password);

    DocumentSnapshot snapshot = await firestoreProvider.getDocumentSnapshot(
      usersCollection,
      firebaseUser.uid,
    );

    // If for some reason the user profile was not found, create a new user
    if (Is.emptyOrNull(snapshot.data())) {
      return _createUser(firebaseUser);
    }

    AppUser user = AppUser.fromJson(
      snapshot.data(),
      reference: snapshot.reference,
    );

    // telemetry
    user.lastActiveAt = DateTime.now();

    await firestoreProvider.updateDocument(
      user.documentReference,
      user.toJson(),
    );

    return user;
  }

  Future<AppUser> getCurrentUser() async {
    User firebaseUser = authProvider.currentUser();
    if (firebaseUser == null) {
      return null;
    }

    AppUser user = await getByUid(firebaseUser.uid);

    // If for some reason the user profile was not found, create a new user
    return user ?? _createUser(firebaseUser);
  }

  Future<AlgoliaQueryResult> queryUsers({
    String query = '',
    int page = 0,
    UserType type,
  }) async {
    List<String> filters = <String>[
      if (Is.truthy(type)) 'type:${EnumToString.convertToString(type)}'
    ];

    return algoliaProvider.search(
      FirestoreCollection.USERS.toString(),
      query,
      facetFilters: filters,
      page: page,
    );
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await authProvider.sendPasswordResetEmail(email);
  }
}
