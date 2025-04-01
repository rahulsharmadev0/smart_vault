import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/repositories/authentication/authentication_base.dart';

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late AuthenticationApi authRepo;

  final mockUser = MockUser(
    isAnonymous: false,
    uid: 'someuid',
    email: 'test@example.com',
    displayName: 'Test User',
  );

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser);
    authRepo = AuthenticationApi(firebaseAuth: mockFirebaseAuth);
  });

  group('AuthenticationRepository', () {
    const testEmail = 'test@example.com';
    const testPassword = 'testPassword123';
    const testDisplayName = 'Test User';

    group('registerWithEmailAndPassword', () {
      test('succeeds with valid credentials', () async {
        await authRepo.signUp(testEmail, testPassword, testDisplayName);

        expect(authRepo.currentUser?.email, equals(testEmail));
        expect(authRepo.currentUser?.displayName, equals(testDisplayName));
      });
    });

    group('signInWithEmailAndPassword', () {
      test('succeeds with valid credentials', () async {
        await authRepo.signIn(testEmail, testPassword);

        expect(authRepo.currentUser?.email, equals(testEmail));
        expect(mockFirebaseAuth.currentUser, isNotNull);
      });
    });

    test('resetPassword sends reset email', () async {
      await expectLater(authRepo.resetPassword(testEmail), completes);
    });

    group('signOut', () {
      test('clears current user', () async {
        // First sign in to ensure we have a current user
        await authRepo.signIn(testEmail, testPassword);

        // Verify we're signed in
        expect(mockFirebaseAuth.currentUser, isNotNull);

        // Perform sign out
        await authRepo.signOut();

        // Verify we're signed out
        expect(mockFirebaseAuth.currentUser, isNull);
      });
    });

    group('user stream', () {
      test('emits user changes', () async {
        final userStream = authRepo.user;

        await authRepo.signIn(testEmail, testPassword);

        expect(userStream, emitsInOrder([isNull, isA<User>()]));
      });
    });

    group('userOnce', () {
      test('returns current user', () async {
        await authRepo.signIn(testEmail, testPassword);

        final currentUser = authRepo.currentUser;
        expect(currentUser?.email, equals(testEmail));
      });
    });
  });
}
