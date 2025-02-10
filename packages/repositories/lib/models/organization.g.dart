// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrganizationCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// Organization(...).copyWith(id: 12, name: "My name")
  /// ````
  Organization call({
    String? email,
    String? name,
    List<Bucket>? buckets,
    DateTime? createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrganization.copyWith(...)`.
class _$OrganizationCWProxyImpl implements _$OrganizationCWProxy {
  const _$OrganizationCWProxyImpl(this._value);

  final Organization _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// Organization(...).copyWith(id: 12, name: "My name")
  /// ````
  Organization call({
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? buckets = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return Organization(
      orgId: _value.orgId,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      buckets: buckets == const $CopyWithPlaceholder() || buckets == null
          ? _value.buckets
          // ignore: cast_nullable_to_non_nullable
          : buckets as List<Bucket>,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
    );
  }
}

extension $OrganizationCopyWith on Organization {
  /// Returns a callable class that can be used as follows: `instanceOfOrganization.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$OrganizationCWProxy get copyWith => _$OrganizationCWProxyImpl(this);
}

abstract class _$BucketCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// Bucket(...).copyWith(id: 12, name: "My name")
  /// ````
  Bucket call({
    String? title,
    String? description,
    DateTime? createdAt,
    List<DocumentType>? fileTypes,
    List<BucketAttributeField>? attributes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBucket.copyWith(...)`.
class _$BucketCWProxyImpl implements _$BucketCWProxy {
  const _$BucketCWProxyImpl(this._value);

  final Bucket _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// Bucket(...).copyWith(id: 12, name: "My name")
  /// ````
  Bucket call({
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? fileTypes = const $CopyWithPlaceholder(),
    Object? attributes = const $CopyWithPlaceholder(),
  }) {
    return Bucket(
      bucketId: _value.bucketId,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      fileTypes: fileTypes == const $CopyWithPlaceholder() || fileTypes == null
          ? _value.fileTypes
          // ignore: cast_nullable_to_non_nullable
          : fileTypes as List<DocumentType>,
      attributes:
          attributes == const $CopyWithPlaceholder() || attributes == null
              ? _value.attributes
              // ignore: cast_nullable_to_non_nullable
              : attributes as List<BucketAttributeField>,
    );
  }
}

extension $BucketCopyWith on Bucket {
  /// Returns a callable class that can be used as follows: `instanceOfBucket.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$BucketCWProxy get copyWith => _$BucketCWProxyImpl(this);
}

abstract class _$BucketTextAttributeFieldCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// BucketTextAttributeField(...).copyWith(id: 12, name: "My name")
  /// ````
  BucketTextAttributeField call({
    String? attributeId,
    String? title,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBucketTextAttributeField.copyWith(...)`.
class _$BucketTextAttributeFieldCWProxyImpl
    implements _$BucketTextAttributeFieldCWProxy {
  const _$BucketTextAttributeFieldCWProxyImpl(this._value);

  final BucketTextAttributeField _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// BucketTextAttributeField(...).copyWith(id: 12, name: "My name")
  /// ````
  BucketTextAttributeField call({
    Object? attributeId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
  }) {
    return BucketTextAttributeField(
      attributeId: attributeId == const $CopyWithPlaceholder()
          ? _value.attributeId
          // ignore: cast_nullable_to_non_nullable
          : attributeId as String?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
    );
  }
}

extension $BucketTextAttributeFieldCopyWith on BucketTextAttributeField {
  /// Returns a callable class that can be used as follows: `instanceOfBucketTextAttributeField.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$BucketTextAttributeFieldCWProxy get copyWith =>
      _$BucketTextAttributeFieldCWProxyImpl(this);
}

abstract class _$BucketDateTimeAttributeFieldCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// BucketDateTimeAttributeField(...).copyWith(id: 12, name: "My name")
  /// ````
  BucketDateTimeAttributeField call({
    String? attributeId,
    String? title,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBucketDateTimeAttributeField.copyWith(...)`.
class _$BucketDateTimeAttributeFieldCWProxyImpl
    implements _$BucketDateTimeAttributeFieldCWProxy {
  const _$BucketDateTimeAttributeFieldCWProxyImpl(this._value);

  final BucketDateTimeAttributeField _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// BucketDateTimeAttributeField(...).copyWith(id: 12, name: "My name")
  /// ````
  BucketDateTimeAttributeField call({
    Object? attributeId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
  }) {
    return BucketDateTimeAttributeField(
      attributeId: attributeId == const $CopyWithPlaceholder()
          ? _value.attributeId
          // ignore: cast_nullable_to_non_nullable
          : attributeId as String?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
    );
  }
}

extension $BucketDateTimeAttributeFieldCopyWith
    on BucketDateTimeAttributeField {
  /// Returns a callable class that can be used as follows: `instanceOfBucketDateTimeAttributeField.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$BucketDateTimeAttributeFieldCWProxy get copyWith =>
      _$BucketDateTimeAttributeFieldCWProxyImpl(this);
}

abstract class _$BucketSingleSelectAttributeFieldCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// BucketSingleSelectAttributeField(...).copyWith(id: 12, name: "My name")
  /// ````
  BucketSingleSelectAttributeField call({
    String? attributeId,
    String? title,
    List<Option>? options,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBucketSingleSelectAttributeField.copyWith(...)`.
class _$BucketSingleSelectAttributeFieldCWProxyImpl
    implements _$BucketSingleSelectAttributeFieldCWProxy {
  const _$BucketSingleSelectAttributeFieldCWProxyImpl(this._value);

  final BucketSingleSelectAttributeField _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// BucketSingleSelectAttributeField(...).copyWith(id: 12, name: "My name")
  /// ````
  BucketSingleSelectAttributeField call({
    Object? attributeId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? options = const $CopyWithPlaceholder(),
  }) {
    return BucketSingleSelectAttributeField(
      attributeId: attributeId == const $CopyWithPlaceholder()
          ? _value.attributeId
          // ignore: cast_nullable_to_non_nullable
          : attributeId as String?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      options: options == const $CopyWithPlaceholder() || options == null
          ? _value.options
          // ignore: cast_nullable_to_non_nullable
          : options as List<Option>,
    );
  }
}

extension $BucketSingleSelectAttributeFieldCopyWith
    on BucketSingleSelectAttributeField {
  /// Returns a callable class that can be used as follows: `instanceOfBucketSingleSelectAttributeField.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$BucketSingleSelectAttributeFieldCWProxy get copyWith =>
      _$BucketSingleSelectAttributeFieldCWProxyImpl(this);
}

abstract class _$BucketMultiSelectAttributeFieldCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// BucketMultiSelectAttributeField(...).copyWith(id: 12, name: "My name")
  /// ````
  BucketMultiSelectAttributeField call({
    String? attributeId,
    String? title,
    List<Option>? options,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBucketMultiSelectAttributeField.copyWith(...)`.
class _$BucketMultiSelectAttributeFieldCWProxyImpl
    implements _$BucketMultiSelectAttributeFieldCWProxy {
  const _$BucketMultiSelectAttributeFieldCWProxyImpl(this._value);

  final BucketMultiSelectAttributeField _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// BucketMultiSelectAttributeField(...).copyWith(id: 12, name: "My name")
  /// ````
  BucketMultiSelectAttributeField call({
    Object? attributeId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? options = const $CopyWithPlaceholder(),
  }) {
    return BucketMultiSelectAttributeField(
      attributeId: attributeId == const $CopyWithPlaceholder()
          ? _value.attributeId
          // ignore: cast_nullable_to_non_nullable
          : attributeId as String?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      options: options == const $CopyWithPlaceholder() || options == null
          ? _value.options
          // ignore: cast_nullable_to_non_nullable
          : options as List<Option>,
    );
  }
}

extension $BucketMultiSelectAttributeFieldCopyWith
    on BucketMultiSelectAttributeField {
  /// Returns a callable class that can be used as follows: `instanceOfBucketMultiSelectAttributeField.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$BucketMultiSelectAttributeFieldCWProxy get copyWith =>
      _$BucketMultiSelectAttributeFieldCWProxyImpl(this);
}

abstract class _$OptionCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// Option(...).copyWith(id: 12, name: "My name")
  /// ````
  Option call({
    String? id,
    String? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOption.copyWith(...)`.
class _$OptionCWProxyImpl implements _$OptionCWProxy {
  const _$OptionCWProxyImpl(this._value);

  final Option _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// Option(...).copyWith(id: 12, name: "My name")
  /// ````
  Option call({
    Object? id = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return Option(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String,
    );
  }
}

extension $OptionCopyWith on Option {
  /// Returns a callable class that can be used as follows: `instanceOfOption.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$OptionCWProxy get copyWith => _$OptionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) => Organization(
      orgId: json['orgId'] as String?,
      email: json['email'] as String,
      name: json['name'] as String,
      buckets: (json['buckets'] as List<dynamic>?)
              ?.map((e) => Bucket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'buckets': instance.buckets.map((e) => e.toJson()).toList(),
      'orgId': instance.orgId,
      'createdAt': instance.createdAt.toIso8601String(),
    };

Bucket _$BucketFromJson(Map<String, dynamic> json) => Bucket(
      bucketId: json['bucketId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      fileTypes: (json['fileTypes'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DocumentTypeEnumMap, e))
              .toList() ??
          const [],
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => const BucketAttributeFieldJsonConverter()
                  .fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BucketToJson(Bucket instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'fileTypes':
          instance.fileTypes.map((e) => _$DocumentTypeEnumMap[e]!).toList(),
      'attributes': instance.attributes
          .map(const BucketAttributeFieldJsonConverter().toJson)
          .toList(),
      'bucketId': instance.bucketId,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$DocumentTypeEnumMap = {
  DocumentType.pdf: 'pdf',
  DocumentType.doc: 'doc',
  DocumentType.sheet: 'sheet',
  DocumentType.md: 'md',
  DocumentType.txt: 'txt',
};

BucketTextAttributeField _$BucketTextAttributeFieldFromJson(
        Map<String, dynamic> json) =>
    BucketTextAttributeField(
      attributeId: json['attributeId'] as String?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$BucketTextAttributeFieldToJson(
        BucketTextAttributeField instance) =>
    <String, dynamic>{
      'title': instance.title,
      'attributeId': instance.attributeId,
    };

BucketDateTimeAttributeField _$BucketDateTimeAttributeFieldFromJson(
        Map<String, dynamic> json) =>
    BucketDateTimeAttributeField(
      attributeId: json['attributeId'] as String?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$BucketDateTimeAttributeFieldToJson(
        BucketDateTimeAttributeField instance) =>
    <String, dynamic>{
      'title': instance.title,
      'attributeId': instance.attributeId,
    };

BucketSingleSelectAttributeField _$BucketSingleSelectAttributeFieldFromJson(
        Map<String, dynamic> json) =>
    BucketSingleSelectAttributeField(
      attributeId: json['attributeId'] as String?,
      title: json['title'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BucketSingleSelectAttributeFieldToJson(
        BucketSingleSelectAttributeField instance) =>
    <String, dynamic>{
      'title': instance.title,
      'attributeId': instance.attributeId,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };

BucketMultiSelectAttributeField _$BucketMultiSelectAttributeFieldFromJson(
        Map<String, dynamic> json) =>
    BucketMultiSelectAttributeField(
      attributeId: json['attributeId'] as String?,
      title: json['title'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BucketMultiSelectAttributeFieldToJson(
        BucketMultiSelectAttributeField instance) =>
    <String, dynamic>{
      'title': instance.title,
      'attributeId': instance.attributeId,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: json['id'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
