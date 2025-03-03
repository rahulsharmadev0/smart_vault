import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:repositories/models/organization.dart';
import 'package:repositories/repositories/organization/organization_repository.dart';

class MockFirebaseDatabase extends Mock implements FirebaseDatabase {}

class MockDatabaseReference extends Mock implements DatabaseReference {}

class MockDataSnapshot extends Mock implements DataSnapshot {}

void main() {
  late MockFirebaseDatabase mockFirebaseDatabase;
  late MockDatabaseReference mockDatabaseReference;
  late MockDatabaseReference mockOrgReference;
  late OrganizationRepository repository;
  late Organization testOrganization;

  setUp(() {
    mockFirebaseDatabase = MockFirebaseDatabase();
    mockDatabaseReference = MockDatabaseReference();
    mockOrgReference = MockDatabaseReference();

    when(() => mockFirebaseDatabase.ref('organizations')).thenReturn(mockDatabaseReference);
    when(() => mockDatabaseReference.child(any())).thenReturn(mockOrgReference);

    repository = OrganizationRepository(OrganizationFirebaseApi(firestore: mockFirebaseDatabase));

    final now = DateTime.now();
    testOrganization = Organization(
      orgId: 'test-org-id',
      email: 'test@example.com',
      name: 'Test Organization',
      buckets: const [],
      createdAt: now,
      updatedAt: now,
    );
  });

  group('OrganizationRepository', () {
    test('create - should call set with correct data', () async {
      when(() => mockOrgReference.set(any())).thenAnswer((_) async => true);

      await repository.create(testOrganization);

      verify(() => mockOrgReference.set(testOrganization.toJson())).called(1);
    });

    // test('update - should call update with correct data', () async {
    //   when(() => mockOrgReference.update(any())).thenAnswer((_) async => true);

    //   await repository.updateName('test-org-id', 'New Name');

    //   verify(() => mockOrgReference.update(testOrganization.toJson())).called(1);
    // });

    test('delete - should call remove on correct reference', () async {
      when(() => mockOrgReference.remove()).thenAnswer((_) async => true);

      await repository.delete('test-org-id');

      verify(() => mockOrgReference.remove()).called(1);
    });

    test('get - should return organization from snapshot', () async {
      final mockSnapshot = MockDataSnapshot();
      when(() => mockOrgReference.get()).thenAnswer((_) async => mockSnapshot);
      when(() => mockSnapshot.value).thenReturn(testOrganization.toJson());

      final result = await repository.getById('test-org-id');

      expect(result.orgId, equals(testOrganization.orgId));
      expect(result.email, equals(testOrganization.email));
      expect(result.name, equals(testOrganization.name));
      expect(result.buckets, equals(testOrganization.buckets));
      expect(result.createdAt, equals(testOrganization.createdAt));
      expect(result.updatedAt, equals(testOrganization.updatedAt));
      verify(() => mockOrgReference.get()).called(1);
    });
  });
}
