import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
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

//
//===============================================================
//  Organization
//===============================================================
//

@freezed
sealed class Organization with _$Organization {
  @override
  final String orgId;
  @override
  final DateTime createdAt, updatedAt;

  Organization._({String? orgId, DateTime? createdAt, DateTime? updatedAt})
    : orgId = orgId ?? const Uuid().v4(),
      createdAt = createdAt ?? DateTime.now(),
      updatedAt = updatedAt ?? DateTime.now();

  factory Organization({
    String? orgId,
    required String email,
    required String name,
    @Default([]) List<Bucket> buckets,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
}

//
//===============================================================
//  Bucket
//===============================================================
//

@freezed
sealed class Bucket with _$Bucket {
  @override
  final String bucketId;

  @override
  final DateTime createdAt, updatedAt;
  Bucket._({String? bucketId, DateTime? createdAt, DateTime? updatedAt})
    : bucketId = bucketId ?? const Uuid().v4(),
      createdAt = createdAt ?? DateTime.now(),
      updatedAt = updatedAt ?? DateTime.now();

  factory Bucket({
    String? bucketId,
    required String title,
    required String description,
    required List<DocumentType> fileTypes,
    @Default([]) List<Attribute> attributes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Bucket;

  factory Bucket.fromJson(Map<String, dynamic> json) => _$BucketFromJson(json);
}

//
//===============================================================
//  Attribute
//===============================================================
//

@freezed
sealed class Attribute with _$Attribute {
  const factory Attribute.text({required String label, required String attributeId}) = TextAttribute;

  const factory Attribute.dateTime({required String label, required String attributeId}) = DateTimeAttribute;

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

//
//===============================================================
//  DocumentFile
//===============================================================

// Actuall DocumentFile file
@freezed
sealed class DocumentFile with _$DocumentFile {
  @override
  final String fileId;
  @override
  final DateTime uploadedAt, updatedAt;

  DocumentFile._({String? fileId, DateTime? uploadedAt, DateTime? updatedAt})
    : fileId = fileId ?? const Uuid().v4(),
      uploadedAt = uploadedAt ?? DateTime.now(),
      updatedAt = updatedAt ?? DateTime.now();

  factory DocumentFile({
    required String orgId,
    required String bucketId,
    required String name,
    required String fileUrl,
    String? fileId,
    DateTime? uploadedAt,
    DateTime? updatedAt,
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
