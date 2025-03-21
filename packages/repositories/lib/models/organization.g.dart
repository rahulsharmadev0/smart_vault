// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Organization _$OrganizationFromJson(Map<String, dynamic> json) =>
    _Organization(
      orgId: json['orgId'] as String?,
      email: json['email'] as String,
      name: json['name'] as String,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$OrganizationToJson(_Organization instance) =>
    <String, dynamic>{
      'orgId': instance.orgId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'email': instance.email,
      'name': instance.name,
      'description': instance.description,
    };

_DocumentFile _$DocumentFileFromJson(Map<String, dynamic> json) =>
    _DocumentFile(
      orgId: json['orgId'] as String,
      bucketId: json['bucketId'] as String,
      name: json['name'] as String,
      fullPath: json['fullPath'] as String,
      type: $enumDecode(_$DocumentTypeEnumMap, json['type']),
      description: json['description'] as String?,
      fileId: json['fileId'] as String?,
      uploadedAt:
          json['uploadedAt'] == null
              ? null
              : DateTime.parse(json['uploadedAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$DocumentFileToJson(_DocumentFile instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'orgId': instance.orgId,
      'bucketId': instance.bucketId,
      'name': instance.name,
      'fullPath': instance.fullPath,
      'type': _$DocumentTypeEnumMap[instance.type]!,
      'description': instance.description,
      'attributes': instance.attributes,
    };

const _$DocumentTypeEnumMap = {
  DocumentType.pdf: 'pdf',
  DocumentType.doc: 'doc',
  DocumentType.sheet: 'sheet',
  DocumentType.md: 'md',
  DocumentType.txt: 'txt',
  DocumentType.csv: 'csv',
};

_Bucket _$BucketFromJson(Map<String, dynamic> json) => _Bucket(
  bucketId: json['bucketId'] as String?,
  orgId: json['orgId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  fileTypes:
      (json['fileTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$DocumentTypeEnumMap, e))
          .toList(),
  attributes:
      (json['attributes'] as List<dynamic>?)
          ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$BucketToJson(_Bucket instance) => <String, dynamic>{
  'bucketId': instance.bucketId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'orgId': instance.orgId,
  'title': instance.title,
  'description': instance.description,
  'fileTypes':
      instance.fileTypes.map((e) => _$DocumentTypeEnumMap[e]!).toList(),
  'attributes': instance.attributes,
};

TextAttribute _$TextAttributeFromJson(Map<String, dynamic> json) =>
    TextAttribute(
      label: json['label'] as String,
      attributeId: json['attributeId'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TextAttributeToJson(TextAttribute instance) =>
    <String, dynamic>{
      'attributeId': instance.attributeId,
      'label': instance.label,
      'runtimeType': instance.$type,
    };

DateTimeAttribute _$DateTimeAttributeFromJson(Map<String, dynamic> json) =>
    DateTimeAttribute(
      label: json['label'] as String,
      attributeId: json['attributeId'] as String?,
      firstDate: DateTime.parse(json['firstDate'] as String),
      lastDate: DateTime.parse(json['lastDate'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$DateTimeAttributeToJson(DateTimeAttribute instance) =>
    <String, dynamic>{
      'attributeId': instance.attributeId,
      'label': instance.label,
      'firstDate': instance.firstDate.toIso8601String(),
      'lastDate': instance.lastDate.toIso8601String(),
      'runtimeType': instance.$type,
    };

SingleSelectAttribute _$SingleSelectAttributeFromJson(
  Map<String, dynamic> json,
) => SingleSelectAttribute(
  label: json['label'] as String,
  attributeId: json['attributeId'] as String?,
  options:
      (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SingleSelectAttributeToJson(
  SingleSelectAttribute instance,
) => <String, dynamic>{
  'attributeId': instance.attributeId,
  'label': instance.label,
  'options': instance.options,
  'runtimeType': instance.$type,
};

MultiSelectAttribute _$MultiSelectAttributeFromJson(
  Map<String, dynamic> json,
) => MultiSelectAttribute(
  label: json['label'] as String,
  attributeId: json['attributeId'] as String?,
  options:
      (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MultiSelectAttributeToJson(
  MultiSelectAttribute instance,
) => <String, dynamic>{
  'attributeId': instance.attributeId,
  'label': instance.label,
  'options': instance.options,
  'runtimeType': instance.$type,
};

_Option _$OptionFromJson(Map<String, dynamic> json) =>
    _Option(id: json['id'] as String?, value: json['value'] as String);

Map<String, dynamic> _$OptionToJson(_Option instance) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
};
