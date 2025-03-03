part of 'authentication_repository.dart';

class AuthenticationException implements Exception {
  const AuthenticationException([this.message = 'An unknown exception occurred.']);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory AuthenticationException.fromCode(String code) {
    var msg = switch (code) {
      'invalid-email' => 'Email is not valid or badly formatted.',
      'user-disabled' => 'This user has been disabled. Please contact support for help.',
      'email-already-in-use' => 'An account already exists for that email.',
      'operation-not-allowed' => 'Operation is not allowed.  Please contact support.',
      'weak-password' => 'Please enter a stronger password.',
      'user-not-found' => 'Email is not found, please create an account.',
      'wrong-password' => 'Incorrect password, please try again.',
      'account-exists-with-different-credential' => 'Account exists with different credentials.',
      'invalid-credential' => 'The credential received is malformed or has expired.',
      'invalid-verification-code' => 'The credential verification code received is invalid.',
      'invalid-verification-id' => 'The credential verification ID received is invalid.',
      _ => 'An unknown exception occurred.',
    };
    return AuthenticationException(msg);
  }

  /// The associated error message.
  final String message;

  @override
  String toString() => message;
}
