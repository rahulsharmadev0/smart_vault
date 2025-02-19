// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationImpl _$$OrganizationImplFromJson(Map<String, dynamic> json) =>
    _$OrganizationImpl(
      orgId: json['orgId'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      buckets: (json['buckets'] as List<dynamic>?)
              ?.map((e) => Bucket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$OrganizationImplToJson(_$OrganizationImpl instance) =>
    <String, dynamic>{
      'orgId': instance.orgId,
      'email': instance.email,
      'name': instance.name,
      'buckets': instance.buckets,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'description': instance.description,
    };

_$BucketImpl _$$BucketImplFromJson(Map<String, dynamic> json) => _$BucketImpl(
      bucketId: json['bucketId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      fileTypes: (json['fileTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$DocumentTypeEnumMap, e))
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BucketImplToJson(_$BucketImpl instance) =>
    <String, dynamic>{
      'bucketId': instance.bucketId,
      'title': instance.title,
      'description': instance.description,
      'fileTypes':
          instance.fileTypes.map((e) => _$DocumentTypeEnumMap[e]!).toList(),
      'attributes': instance.attributes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$DocumentTypeEnumMap = {
  DocumentType.pdf: 'pdf',
  DocumentType.doc: 'doc',
  DocumentType.sheet: 'sheet',
  DocumentType.md: 'md',
  DocumentType.txt: 'txt',
};

_$TextAttributeImpl _$$TextAttributeImplFromJson(Map<String, dynamic> json) =>
    _$TextAttributeImpl(
      label: json['label'] as String,
      attributeId: json['attributeId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TextAttributeImplToJson(_$TextAttributeImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'attributeId': instance.attributeId,
      'runtimeType': instance.$type,
    };

_$DateTimeAttributeImpl _$$DateTimeAttributeImplFromJson(
        Map<String, dynamic> json) =>
    _$DateTimeAttributeImpl(
      label: json['label'] as String,
      attributeId: json['attributeId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DateTimeAttributeImplToJson(
        _$DateTimeAttributeImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'attributeId': instance.attributeId,
      'runtimeType': instance.$type,
    };

_$SingleSelectAttributeImpl _$$SingleSelectAttributeImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleSelectAttributeImpl(
      label: json['label'] as String,
      attributeId: json['attributeId'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SingleSelectAttributeImplToJson(
        _$SingleSelectAttributeImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'attributeId': instance.attributeId,
      'options': instance.options,
      'runtimeType': instance.$type,
    };

_$MultiSelectAttributeImpl _$$MultiSelectAttributeImplFromJson(
        Map<String, dynamic> json) =>
    _$MultiSelectAttributeImpl(
      label: json['label'] as String,
      attributeId: json['attributeId'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MultiSelectAttributeImplToJson(
        _$MultiSelectAttributeImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'attributeId': instance.attributeId,
      'options': instance.options,
      'runtimeType': instance.$type,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      id: json['id'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

_$DocumentFileImpl _$$DocumentFileImplFromJson(Map<String, dynamic> json) =>
    _$DocumentFileImpl(
      fileId: json['fileId'] as String,
      orgId: json['orgId'] as String,
      bucketId: json['bucketId'] as String,
      name: json['name'] as String,
      fileUrl: json['fileUrl'] as String,
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$DocumentFileImplToJson(_$DocumentFileImpl instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'orgId': instance.orgId,
      'bucketId': instance.bucketId,
      'name': instance.name,
      'fileUrl': instance.fileUrl,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'attributes': instance.attributes,
    };
