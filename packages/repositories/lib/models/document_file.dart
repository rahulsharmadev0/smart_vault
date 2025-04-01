part of 'organization.dart';

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
    required bool isDraft,

    /// The full path of this object.
    required String fullPath,
    required DocumentType type,
    String? description,
    String? fileId,
    DateTime? uploadedAt,
    DateTime? updatedAt,
    @Default({}) Map<String, dynamic>? attributes,
  }) = _DocumentFile;

  factory DocumentFile.fromJson(Map<String, dynamic> json) =>
      _$DocumentFileFromJson(json);

  // Speceficly desigened as per database schema
  static DocumentFile fromFireStore(final Map<String, dynamic> json) {
    return DocumentFile(
      fileId: json.remove('fileId'),
      name: json.remove('name'),
      fullPath: json.remove('fullPath'),
      bucketId: json.remove('bucketId'),
      description: json.remove('description'),
      type: DocumentType.values.byName(json.remove('type')),
      uploadedAt: DateTime.parse(json.remove('uploadedAt')),
      updatedAt: DateTime.parse(json.remove('updatedAt')),
      orgId: json.remove('orgId'),
      isDraft: json.remove('isDraft'),
      attributes: json,
    );
  }

  // Speceficly desigened as per database schema
  Map<String, dynamic> toFireStore() => {
    'fileId': fileId,
    'name': name,
    'fullPath': fullPath,
    'bucketId': bucketId,
    'uploadedAt': uploadedAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'orgId': orgId,
    'description': description,
    'type': type.name,
    'isDraft': isDraft,
    ...?attributes,
  };
}
