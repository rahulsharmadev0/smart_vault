import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';

part 'authentication_exception.dart';

class AuthenticationRepository {
  final firebase_auth.FirebaseAuth _fAuth;
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _fAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  /// Whether or not the current environment is web
  /// Should only be overridden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  Stream<firebase_auth.User?> get user => _fAuth.authStateChanges();

  firebase_auth.User? get userOnce => _fAuth.currentUser;

  // Register new user with email and password
  Future<firebase_auth.UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final credential = await _fAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .handleAuthError<firebase_auth.UserCredential>();

    await credential.user?.updateDisplayName(displayName).handleAuthError();

    return credential;
  }

  // Sign in with email and password
  Future<firebase_auth.UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return _fAuth.signInWithEmailAndPassword(email: email, password: password).handleAuthError();
  }

  // Reset password
  Future<void> resetPassword(String email) => _fAuth.sendPasswordResetEmail(email: email).handleAuthError();

  // Sign out
  Future<void> signOut() async {
    return await _fAuth.signOut().handleAuthError();
  }
}

extension FutureExt<T> on Future<T> {
  /// Handles authentication errors and transforms the result
  Future<R> handleAuthError<R>([FutureOr<R> Function(T value)? onValue]) {
    return then((value) => onValue?.call(value) ?? value as R).catchError((error) {
      if (error is firebase_auth.FirebaseAuthException) {
        throw AuthenticationException.fromCode(error.code);
      }
      throw const AuthenticationException();
    });
  }
}
