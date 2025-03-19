part of 'authentication_base.dart';

class AuthenticationApi extends ApiBase implements AuthenticationBase {
  final fauth.FirebaseAuth _fAuth;
  AuthenticationApi({fauth.FirebaseAuth? firebaseAuth})
    : _fAuth = firebaseAuth ?? fauth.FirebaseAuth.instance;

  /// Whether or not the current environment is web
  /// Should only be overridden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  @override
  Stream<fauth.User?> get user => _fAuth.authStateChanges();

  @override
  bool get hasActiveSession => _fAuth.currentUser != null;

  // Reset password
  @override
  Future<void> resetPassword(String email) =>
      _fAuth.sendPasswordResetEmail(email: email).handleAuthError();

  // Sign out
  @override
  Future<void> signOut() async {
    return await _fAuth.signOut().handleAuthError();
  }

  @override
  Stream<bool> get isSignedIn => user.map((user) => user != null);

  @override
  Future<void> signIn(String email, String password) {
    return _fAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .handleAuthError();
  }

  @override
  Future<void> signUp(String email, String password, String displayName) async {
    final credential =
        await _fAuth
            .createUserWithEmailAndPassword(email: email, password: password)
            .handleAuthError<fauth.UserCredential>();

    credential.user?.updateDisplayName(displayName).handleAuthError();
  }
}

extension FutureExt<T> on Future<T> {
  /// Handles authentication errors and transforms the result
  Future<R> handleAuthError<R>([FutureOr<R> Function(T value)? onValue]) {
    return then((value) => onValue?.call(value) ?? value as R).catchError((error) {
      if (error is fauth.FirebaseAuthException) {
        throw AuthenticationException.fromCode(error.code);
      }
      throw const AuthenticationException();
    });
  }
}
