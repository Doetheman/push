/// -----------------------------------------------------------------
/// 
/// File: mock_auth_provider.dart
/// Project: PUSH
/// File Created: Friday, April 23rd, 2021
/// Description: 
/// 
/// Author: Dorian Holmes - dorian@longsoftware.io
/// -----
/// Last Modified: Friday, April 23rd, 2021
/// Modified By: Dorian Holmes - dorian@longsoftware.io
/// -----
/// 
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
/// 
/// -----------------------------------------------------------------

import 'package:firebase_auth/firebase_auth.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';

class MockAuthProvider implements BaseAuthProvider{
  @override
  Future<User> createNewUserWithEmailAndPassword(String email, String password) {
      // TODO: implement createNewUserWithEmailAndPassword
      throw UnimplementedError();
    }
  
    @override
    String get currentUid => 'UID';
  
    @override
    User currentUser() {
      // TODO: implement currentUser
      throw UnimplementedError();
    }
  
    @override
    bool isEmailVerified() {
      // TODO: implement isEmailVerified
      throw UnimplementedError();
    }
  
    @override
    // TODO: implement isLoggedIn
    bool get isLoggedIn => throw UnimplementedError();
  
    @override
    Stream<User> onAuthStateChanged() {
      // TODO: implement onAuthStateChanged
      throw UnimplementedError();
    }
  
    @override
    void sendEmailVerification() {
      // TODO: implement sendEmailVerification
    }
  
    @override
    Future<void> sendPasswordResetEmail(String email) {
      // TODO: implement sendPasswordResetEmail
      throw UnimplementedError();
    }
  
    @override
    Future<User> signInWithEmailAndPassword(String email, String password) {
      // TODO: implement signInWithEmailAndPassword
      throw UnimplementedError();
    }
  
    @override
    Future<void> signOut() {
      // TODO: implement signOut
      throw UnimplementedError();
    }
  
    @override
    Future<void> updatePassword(String email, String password, String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
  
}