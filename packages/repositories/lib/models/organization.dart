import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
part 'organization_extension.dart';
part 'bucket_attribute_fields.dart';
part 'organization.g.dart';

const _copyWith = CopyWith(skipFields: true);
const _jsonSerializable = JsonSerializable(explicitToJson: true, converters: [
  BucketAttributeFieldJsonConverter(),
]);

@_copyWith
@_jsonSerializable
class Organization extends Equatable {
  final String name;
  final String email;
  final List<Bucket> buckets;

  @CopyWithField(immutable: true)
  final String orgId;

  @CopyWithField(removable: true)
  final DateTime createdAt;

  Organization({
    String? orgId,
    required this.email,
    required this.name,
    this.buckets = const [],
    DateTime? createdAt,
  })  : orgId = orgId ?? Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

  @override
  List<Object?> get props => [orgId, name, email, createdAt, buckets];
}

enum DocumentType {
  pdf('PDF'),
  doc('Document'),
  sheet('Spreadsheet'),
  md('Markdown'),
  txt('Text File');

  final String fullName;
  const DocumentType(this.fullName);
}

@_copyWith
@_jsonSerializable
class Bucket extends Equatable {
  final String title;
  final String description;
  final List<DocumentType> fileTypes;
  final List<BucketAttributeField> attributes;

  @CopyWithField(immutable: true)
  final String bucketId;

  @CopyWithField(removable: true)
  final DateTime createdAt;

  Bucket({
    String? bucketId,
    required this.title,
    required this.description,
    DateTime? createdAt,
    this.fileTypes = const [],
    this.attributes = const [],
  })  : bucketId = bucketId ?? Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  factory Bucket.fromJson(Map<String, dynamic> json) => _$BucketFromJson(json);
  Map<String, dynamic> toJson() => _$BucketToJson(this);

  @override
  List<Object?> get props => [bucketId, title, description, createdAt, attributes, fileTypes];
}
