import 'package:repositories/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testDateTime = DateTime(2023, 12, 1, 10);

  group('Organization', () {
    test('should create an organization with valid properties', () {
      final organization = Organization(
        name: 'Test Organization',
        email: 'test@example.com',
        createdAt: testDateTime,
      );

      expect(organization.name, 'Test Organization');
      expect(organization.email, 'test@example.com');
      expect(organization.orgId, isNotEmpty);
      expect(organization.createdAt, testDateTime);
      expect(organization.buckets, isEmpty);
    });

    test('should convert to and from JSON correctly', () {
      final organization = Organization(
        name: 'Test Organization',
        email: 'test@example.com',
        createdAt: testDateTime,
        buckets: [
          Bucket(
            title: 'Test Bucket',
            description: 'Description',
            createdAt: testDateTime,
          )
        ],
      );

      final json = organization.toJson();
      final fromJson = Organization.fromJson(json);

      expect(json, fromJson.toJson());
      expect(fromJson.name, organization.name);
      expect(fromJson.email, organization.email);
      expect(fromJson.createdAt.toIso8601String(), organization.createdAt.toIso8601String());
      expect(fromJson.buckets.length, 1);
    });

    test('should preserve bucket attributes when converting to/from JSON', () {
      final organization = Organization(
        name: 'Test Org',
        email: 'test@example.com',
        createdAt: testDateTime,
        buckets: [
          Bucket(
            title: 'Test Bucket',
            description: 'Description',
            createdAt: testDateTime,
            attributes: [
              BucketTextAttributeField(title: 'Text Field'),
              BucketDateTimeAttributeField(title: 'Date Field'),
              BucketSingleSelectAttributeField(
                title: 'Single Select',
                options: [
                  Option(id: '1', value: 'Option 1'),
                  Option(id: '2', value: 'Option 2'),
                ],
              ),
            ],
          )
        ],
      );

      final json = organization.toJson();
      final fromJson = Organization.fromJson(json);

      expect(fromJson.buckets.first.attributes.length, 3);
      expect(fromJson.buckets.first.attributes.first, isA<BucketTextAttributeField>());
    });
  });

  group('Bucket', () {
    test('should create a bucket with valid properties', () {
      final bucket = Bucket(
        title: 'Test Bucket',
        description: 'Test Description',
        createdAt: testDateTime,
      );

      expect(bucket.title, 'Test Bucket');
      expect(bucket.description, 'Test Description');
      expect(bucket.bucketId, isNotEmpty);
      expect(bucket.createdAt, testDateTime);
      expect(bucket.attributes, isEmpty);
    });

    test('should handle complex attributes in JSON conversion', () {
      final bucket = Bucket(
        title: 'Test Bucket',
        description: 'Description',
        createdAt: testDateTime,
        attributes: [
          BucketTextAttributeField(title: 'Text'),
          BucketDateTimeAttributeField(title: 'Date'),
          BucketSingleSelectAttributeField(
            title: 'Select',
            options: [
              Option(id: '1', value: 'A'),
              Option(id: '2', value: 'B'),
            ],
          ),
          BucketMultiSelectAttributeField(
            title: 'Multi',
            options: [
              Option(id: '1', value: 'X'),
              Option(id: '2', value: 'Y'),
              Option(id: '3', value: 'Z'),
            ],
          ),
        ],
      );

      final json = bucket.toJson();
      final fromJson = Bucket.fromJson(json);

      expect(fromJson.attributes.length, 4);
      expect(fromJson.attributes[2], isA<BucketSingleSelectAttributeField>());
      expect((fromJson.attributes[2] as BucketSingleSelectAttributeField).options, [
        Option(id: '1', value: 'A'),
        Option(id: '2', value: 'B'),
      ]);
    });
  });

  group('BucketAttributeField', () {
    test('all attribute field types should convert to JSON correctly', () {
      final fields = [
        BucketTextAttributeField(title: 'Text Field'),
        BucketDateTimeAttributeField(title: 'Date Field'),
        BucketSingleSelectAttributeField(
          title: 'Single Select',
          options: [
            Option(id: '1', value: 'Option 1'),
            Option(id: '2', value: 'Option 2'),
          ],
        ),
        BucketMultiSelectAttributeField(
          title: 'Multi Select',
          options: [
            Option(id: '1', value: 'Option 1'),
            Option(id: '2', value: 'Option 2'),
            Option(id: '3', value: 'Option 3'),
          ],
        ),
      ];

      for (final field in fields) {
        final json = field.toJson();
        final fromJson = BucketAttributeField.fromJson(json);

        expect(fromJson.runtimeType, field.runtimeType);
        expect(fromJson.title, field.title);

        if (field is BucketSingleSelectAttributeField) {
          expect((fromJson as BucketSingleSelectAttributeField).options, field.options);
        }
        if (field is BucketMultiSelectAttributeField) {
          expect((fromJson as BucketMultiSelectAttributeField).options, field.options);
        }
      }
    });

    test('should throw exception for unknown field type', () {
      expect(
        () =>
            BucketAttributeField.fromJson({'type': 'UnknownType', 'title': 'Test', 'attributeId': 'test-id'}),
        throwsException,
      );
    });

    test('should maintain attribute IDs when copying', () {
      final bucket = Bucket(
        title: 'Original',
        description: 'Description',
        createdAt: testDateTime,
        attributes: [BucketTextAttributeField(title: 'Text')],
      );

      final originalAttributeId = bucket.attributes.first.attributeId;
      final copied = bucket.copyWith(title: 'New Title');

      expect(copied.attributes.first.attributeId, equals(originalAttributeId));
    });
  });
}
