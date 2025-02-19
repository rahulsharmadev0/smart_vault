import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';
part 'organization_extension.dart';

part 'organization.freezed.dart';
part 'organization.g.dart';

enum DocumentType {
  pdf('PDF'),
  doc('Document'),
  sheet('Spreadsheet'),
  md('Markdown'),
  txt('Text File');

  final String fullName;
  const DocumentType(this.fullName);
}

enum AttributeType { text, dateTime, singleSelect, multiSelect }

@freezed
sealed class Organization with _$Organization {
  const factory Organization({
    required String orgId,
    required String email,
    required String name,
    @Default([]) List<Bucket> buckets,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? description,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
}

@freezed
sealed class Bucket with _$Bucket {
  const factory Bucket({
    required String bucketId,
    required String title,
    required String description,
    required List<DocumentType> fileTypes,
    @Default([]) List<Attribute> attributes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Bucket;

  factory Bucket.fromJson(Map<String, dynamic> json) => _$BucketFromJson(json);
}

@freezed
sealed class Attribute with _$Attribute {
  const factory Attribute.text({
    required String label,
    required String attributeId,
  }) = TextAttribute;

  const factory Attribute.dateTime({
    required String label,
    required String attributeId,
  }) = DateTimeAttribute;

  const factory Attribute.singleSelect({
    required String label,
    required String attributeId,
    required List<Option> options,
  }) = SingleSelectAttribute;

  const factory Attribute.multiSelect({
    required String label,
    required String attributeId,
    required List<Option> options,
  }) = MultiSelectAttribute;

  factory Attribute.fromJson(Map<String, dynamic> json) => _$AttributeFromJson(json);
}

@freezed
sealed class Option with _$Option {
  const factory Option({required String id, required String value}) = _Option;
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

// Actuall DocumentFile file
@freezed
sealed class DocumentFile with _$DocumentFile {
  const DocumentFile._();
  const factory DocumentFile({
    required String fileId,
    required String orgId,
    required String bucketId,
    required String name,
    required String fileUrl,
    required DateTime uploadedAt,
    required DateTime updatedAt,
    @Default({}) Map<String, dynamic> attributes,
  }) = _DocumentFile;

  factory DocumentFile.fromJson(Map<String, dynamic> json) => _$DocumentFileFromJson(json);

  // Speceficly desigened as per database schema
  static DocumentFile fromFireStore(final Map<String, dynamic> json) {
    return DocumentFile(
      fileId: json.remove('fileId'),
      name: json.remove('name'),
      fileUrl: json.remove('fileUrl'),
      bucketId: json.remove('bucketId'),
      uploadedAt: DateTime.parse(json.remove('uploadedAt')),
      updatedAt: DateTime.parse(json.remove('updatedAt')),
      orgId: json.remove('orgId'),
      attributes: json,
    );
  }

  // Speceficly desigened as per database schema
  Map<String, dynamic> toFireStore() => {
        'fileId': fileId,
        'name': name,
        'fileUrl': fileUrl,
        'bucketId': bucketId,
        'uploadedAt': uploadedAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'orgId': orgId,
        ...attributes,
      };
}
