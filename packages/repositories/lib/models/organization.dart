import 'package:app_foundation/gen/assets.gen.dart';
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

  SvgGenImage get icon => switch (this) {
    DocumentType.pdf => Assets.svg.pdf,
    DocumentType.doc => Assets.svg.doc,
    DocumentType.sheet => Assets.svg.md,
    DocumentType.md => Assets.svg.md,
    DocumentType.txt => Assets.svg.txt,
  };
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
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
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
    required String orgId,
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
  @override
  final String attributeId;

  Attribute._({String? attributeId})
    : attributeId = attributeId ?? const Uuid().v4();

  factory Attribute.text({required String label, String? attributeId}) =
      TextAttribute;

  factory Attribute.dateTime({
    required String label,
    String? attributeId,
      required DateTime firstDate,
      required  DateTime lastDate,
  }) = DateTimeAttribute;

  factory Attribute.singleSelect({
    required String label,
    String? attributeId,
    required List<Option> options,
  }) = SingleSelectAttribute;

  factory Attribute.multiSelect({
    required String label,
    String? attributeId,
    required List<Option> options,
  }) = MultiSelectAttribute;

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  T map<T>({
    T Function(TextAttribute)? text,
    T Function(DateTimeAttribute)? dateTime,
    T Function(SingleSelectAttribute)? singleSelect,
    T Function(MultiSelectAttribute)? multiSelect,
    T Function()? orElse,
  }) {
    switch (this) {
      case TextAttribute state:
        return text?.call(state) ?? orElse?.call() as T;
      case DateTimeAttribute state:
        return dateTime?.call(state) ?? orElse?.call() as T;
      case SingleSelectAttribute state:
        return singleSelect?.call(state) ?? orElse?.call() as T;
      case MultiSelectAttribute state:
        return multiSelect?.call(state) ?? orElse?.call() as T;
    }
  }
}

@freezed
sealed class Option with _$Option {
  @override
  final String id;
  Option._({String? id}) : id = id ?? const Uuid().v4();

  factory Option({String? id, required String value}) = _Option;

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
    required DocumentType type,
    String? description,
    String? fileId,
    DateTime? uploadedAt,
    DateTime? updatedAt,
    @Default({}) Map<String, dynamic> attributes,
  }) = _DocumentFile;

  factory DocumentFile.fromJson(Map<String, dynamic> json) =>
      _$DocumentFileFromJson(json);

  // Speceficly desigened as per database schema
  static DocumentFile fromFireStore(final Map<String, dynamic> json) {
    return DocumentFile(
      fileId: json.remove('fileId'),
      name: json.remove('name'),
      fileUrl: json.remove('fileUrl'),
      bucketId: json.remove('bucketId'),
      description: json.remove('description'),
      type: DocumentType.values.byName(json.remove('type')),
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
    'description': description,
    'type': type.name,
    ...attributes,
  };
}
