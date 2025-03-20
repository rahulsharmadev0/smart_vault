import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fauth;
import 'package:flutter/foundation.dart';
import 'package:repositories/repositories/authentication/authentication_base.dart';
import 'package:repositories/utils/repository_base.dart';

part 'authentication_api.dart';
part 'authentication_exception.dart';

abstract class AuthenticationBase {
  bool get hasActiveSession;

  fauth.User? get currentUser;

  Stream<fauth.User?> get user;

  Stream<bool> get isSignedIn;

  FutureOr<void> signIn(String email, String password);

  /// Sign out the current user
  FutureOr<void> signOut();

  FutureOr<void> signUp(String email, String password, String displayName);

  FutureOr<void> resetPassword(String email);
}
