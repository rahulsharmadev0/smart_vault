import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:repositories/models/organization.dart';
import 'package:repositories/repositories/bucket_repository.dart';

class MockFirebaseDatabase extends Mock implements FirebaseDatabase {}

class MockDatabaseReference extends Mock implements DatabaseReference {}

class MockDataSnapshot extends Mock implements DataSnapshot {}

void main() {
  late MockFirebaseDatabase mockFirebaseDatabase;
  late MockDatabaseReference mockDatabaseReference;
  late MockDatabaseReference mockOrgReference;
  late BucketRepository repository;
  late Bucket testBucket;
  const testOrgId = 'test-org-id';

  setUp(() {
    mockFirebaseDatabase = MockFirebaseDatabase();
    mockDatabaseReference = MockDatabaseReference();
    mockOrgReference = MockDatabaseReference();

    when(
      () => mockFirebaseDatabase.ref('organizations'),
    ).thenReturn(mockDatabaseReference);
    when(() => mockDatabaseReference.child(any())).thenReturn(mockOrgReference);

    repository = BucketRepository();

    final now = DateTime.now();
    testBucket = Bucket(
      bucketId: 'test-bucket-id',
      title: 'Test Bucket',
      orgId: testOrgId,
      description: 'Test Description',
      fileTypes: const [DocumentType.pdf, DocumentType.doc],
      attributes: const [],
      createdAt: now,
      updatedAt: now,
    );
  });

  group('BucketRepository', () {
    test('create - should call set with correct data', () async {
      when(() => mockOrgReference.set(any())).thenAnswer((_) async => true);

      await repository.create(testBucket);

      verify(() => mockOrgReference.set(testBucket.toJson())).called(1);
    });

    test('update - should call update with correct data', () async {
      when(() => mockOrgReference.update(any())).thenAnswer((_) async => true);

      await repository.update(testBucket);

      verify(() => mockOrgReference.update(testBucket.toJson())).called(1);
    });

    test('delete - should call remove on correct reference', () async {
      when(() => mockOrgReference.remove()).thenAnswer((_) async => true);

      await repository.delete(testBucket.bucketId);

      verify(() => mockOrgReference.remove()).called(1);
    });

    test('getBucket - should return bucket from snapshot', () async {
      final mockSnapshot = MockDataSnapshot();
      when(() => mockOrgReference.get()).thenAnswer((_) async => mockSnapshot);
      when(() => mockSnapshot.value).thenReturn(testBucket.toJson());

      final result = await repository.getBucketById(testBucket.bucketId);

      expect(result!.bucketId, equals(testBucket.bucketId));
      expect(result.title, equals(testBucket.title));
      expect(result.description, equals(testBucket.description));
      expect(result.fileTypes, equals(testBucket.fileTypes));
      expect(result.attributes, equals(testBucket.attributes));
      verify(() => mockOrgReference.get()).called(1);
    });

    test('getBuckets - should return multiple buckets from snapshots', () async {
      final mockSnapshot = MockDataSnapshot();
      when(() => mockOrgReference.get()).thenAnswer((_) async => mockSnapshot);
      when(() => mockSnapshot.value).thenReturn(testBucket.toJson());

      final results = await repository.getBucketsByOrgId(testOrgId);

      expect(results.length, equals(1));
      expect(results.first.bucketId, equals(testBucket.bucketId));
      verify(() => mockOrgReference.get()).called(1);
    });
  });
}
