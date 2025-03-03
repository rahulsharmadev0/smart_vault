import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repositories/repositories/authentication/authentication_repository.dart';

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late AuthenticationRepository authRepo;

  final mockUser = MockUser(
    isAnonymous: false,
    uid: 'someuid',
    email: 'test@example.com',
    displayName: 'Test User',
  );

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser);
    authRepo = AuthenticationRepository(firebaseAuth: mockFirebaseAuth);
  });

  group('AuthenticationRepository', () {
    const testEmail = 'test@example.com';
    const testPassword = 'testPassword123';
    const testDisplayName = 'Test User';

    group('registerWithEmailAndPassword', () {
      test('succeeds with valid credentials', () async {
        final credential = await authRepo.registerWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
          displayName: testDisplayName,
        );

        expect(credential.user?.email, equals(testEmail));
        expect(credential.user?.displayName, equals(testDisplayName));
      });
    });

    group('signInWithEmailAndPassword', () {
      test('succeeds with valid credentials', () async {
        final credential = await authRepo.signInWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        );

        expect(credential.user?.email, equals(testEmail));
        expect(mockFirebaseAuth.currentUser, isNotNull);
      });
    });

    test('resetPassword sends reset email', () async {
      await expectLater(authRepo.resetPassword(testEmail), completes);
    });

    group('signOut', () {
      test('clears current user', () async {
        // First sign in to ensure we have a current user
        await authRepo.signInWithEmailAndPassword(email: testEmail, password: testPassword);

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

        await authRepo.signInWithEmailAndPassword(email: testEmail, password: testPassword);

        expect(userStream, emitsInOrder([isNull, isA<User>()]));
      });
    });

    group('userOnce', () {
      test('returns current user', () async {
        await authRepo.signInWithEmailAndPassword(email: testEmail, password: testPassword);

        final currentUser = authRepo.userOnce;
        expect(currentUser?.email, equals(testEmail));
      });
    });
  });
}
