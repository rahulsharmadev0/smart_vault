import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:repositories/repositories/authentication/authentication_base.dart';
import 'package:repositories/utils/repository_base.dart';

class AuthenticationRepository extends Repository<AuthenticationApi>
    implements AuthenticationBase {
  AuthenticationRepository(super.api);

    @override
  User? get currentUser => api.currentUser;

  @override
  bool get hasActiveSession => api.hasActiveSession;

  @override
  Stream<User?> get user => api.user;

  @override
  Stream<bool> get isSignedIn => api.isSignedIn;

  @override
  FutureOr<void> resetPassword(String email) => api.resetPassword(email);

  @override
  FutureOr<void> signIn(String email, String password) =>
      api.signIn(email, password);

  @override
  FutureOr<void> signOut() => api.signOut();

  @override
  FutureOr<void> signUp(String email, String password, String displayName) =>
      api.signUp(email, password, displayName);


}
