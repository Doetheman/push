/// -----------------------------------------------------------------
///
/// File: auth_provider.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pedantic/pedantic.dart';

abstract class BaseAuthProvider {
  Future<User> signInWithEmailAndPassword(String email, String password);

  Future<User> createNewUserWithEmailAndPassword(String email, String password);

  User currentUser();

  String get currentUid;

  bool get isLoggedIn;

  void sendEmailVerification();

  Future<void> signOut();

  bool isEmailVerified();

  Future<void> updatePassword(
      String email, String password, String newPassword);

  Future<void> sendPasswordResetEmail(String email);

  Stream<User> onAuthStateChanged();
}

class AuthProvider implements BaseAuthProvider {
  FirebaseAuth auth = FirebaseAuth.instance;
  AuthProvider(dynamic auth);

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  User currentUser() => auth.currentUser;

  @override
  String get currentUid => currentUser().uid;

  @override
  bool get isLoggedIn => auth.currentUser != null;

  @override
  Future<User> createNewUserWithEmailAndPassword(
      String email, String password) async {
    User user = (await auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    User user = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> updatePassword(
      String email, String password, String newPassword) async {
    User user = await signInWithEmailAndPassword(email, password);
    await user.updatePassword(newPassword);
  }

  @override
  Stream<User> onAuthStateChanged() => auth.authStateChanges();

  @override
  bool isEmailVerified() {
    User user = auth.currentUser;
    return user.emailVerified;
  }

  @override
  void sendEmailVerification() {
    User user = auth.currentUser;
    unawaited(user.sendEmailVerification());
  }
}
