// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
return _Organization.fromJson(json);
}

/// @nodoc
mixin _$Organization {

 String get orgId => throw _privateConstructorUsedError; String get email => throw _privateConstructorUsedError; String get name => throw _privateConstructorUsedError; List<Bucket> get buckets => throw _privateConstructorUsedError; DateTime get createdAt => throw _privateConstructorUsedError; DateTime get updatedAt => throw _privateConstructorUsedError; String? get description => throw _privateConstructorUsedError;






/// Serializes this Organization to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$OrganizationCopyWith<Organization> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $OrganizationCopyWith<$Res>  {
  factory $OrganizationCopyWith(Organization value, $Res Function(Organization) then) = _$OrganizationCopyWithImpl<$Res, Organization>;
@useResult
$Res call({
 String orgId, String email, String name, List<Bucket> buckets, DateTime createdAt, DateTime updatedAt, String? description
});



}

/// @nodoc
class _$OrganizationCopyWithImpl<$Res,$Val extends Organization> implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = null,Object? email = null,Object? name = null,Object? buckets = null,Object? createdAt = null,Object? updatedAt = null,Object? description = freezed,}) {
  return _then(_value.copyWith(
orgId: null == orgId ? _value.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,buckets: null == buckets ? _value.buckets : buckets // ignore: cast_nullable_to_non_nullable
as List<Bucket>,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _value.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$OrganizationImplCopyWith<$Res> implements $OrganizationCopyWith<$Res> {
  factory _$$OrganizationImplCopyWith(_$OrganizationImpl value, $Res Function(_$OrganizationImpl) then) = __$$OrganizationImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String orgId, String email, String name, List<Bucket> buckets, DateTime createdAt, DateTime updatedAt, String? description
});



}

/// @nodoc
class __$$OrganizationImplCopyWithImpl<$Res> extends _$OrganizationCopyWithImpl<$Res, _$OrganizationImpl> implements _$$OrganizationImplCopyWith<$Res> {
  __$$OrganizationImplCopyWithImpl(_$OrganizationImpl _value, $Res Function(_$OrganizationImpl) _then)
      : super(_value, _then);


/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = null,Object? email = null,Object? name = null,Object? buckets = null,Object? createdAt = null,Object? updatedAt = null,Object? description = freezed,}) {
  return _then(_$OrganizationImpl(
orgId: null == orgId ? _value.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,buckets: null == buckets ? _value._buckets : buckets // ignore: cast_nullable_to_non_nullable
as List<Bucket>,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _value.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$OrganizationImpl  with DiagnosticableTreeMixin implements _Organization {
  const _$OrganizationImpl({required this.orgId, required this.email, required this.name, final  List<Bucket> buckets = const [], required this.createdAt, required this.updatedAt, this.description}): _buckets = buckets;

  factory _$OrganizationImpl.fromJson(Map<String, dynamic> json) => _$$OrganizationImplFromJson(json);

@override final  String orgId;
@override final  String email;
@override final  String name;
 final  List<Bucket> _buckets;
@override@JsonKey() List<Bucket> get buckets {
  if (_buckets is EqualUnmodifiableListView) return _buckets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_buckets);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? description;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Organization(orgId: $orgId, email: $email, name: $name, buckets: $buckets, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'Organization'))
    ..add(DiagnosticsProperty('orgId', orgId))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('buckets', buckets))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('description', description));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$OrganizationImpl&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._buckets, _buckets)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,email,name,const DeepCollectionEquality().hash(_buckets),createdAt,updatedAt,description);

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith => __$$OrganizationImplCopyWithImpl<_$OrganizationImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$OrganizationImplToJson(this, );
}
}


abstract class _Organization implements Organization {
  const factory _Organization({required final  String orgId, required final  String email, required final  String name, final  List<Bucket> buckets, required final  DateTime createdAt, required final  DateTime updatedAt, final  String? description}) = _$OrganizationImpl;
  

  factory _Organization.fromJson(Map<String, dynamic> json) = _$OrganizationImpl.fromJson;

@override String get orgId;@override String get email;@override String get name;@override List<Bucket> get buckets;@override DateTime get createdAt;@override DateTime get updatedAt;@override String? get description;
/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith => throw _privateConstructorUsedError;

}

Bucket _$BucketFromJson(Map<String, dynamic> json) {
return _Bucket.fromJson(json);
}

/// @nodoc
mixin _$Bucket {

 String get bucketId => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; String get description => throw _privateConstructorUsedError; List<DocumentType> get fileTypes => throw _privateConstructorUsedError; List<Attribute> get attributes => throw _privateConstructorUsedError; DateTime get createdAt => throw _privateConstructorUsedError; DateTime get updatedAt => throw _privateConstructorUsedError;






/// Serializes this Bucket to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$BucketCopyWith<Bucket> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $BucketCopyWith<$Res>  {
  factory $BucketCopyWith(Bucket value, $Res Function(Bucket) then) = _$BucketCopyWithImpl<$Res, Bucket>;
@useResult
$Res call({
 String bucketId, String title, String description, List<DocumentType> fileTypes, List<Attribute> attributes, DateTime createdAt, DateTime updatedAt
});



}

/// @nodoc
class _$BucketCopyWithImpl<$Res,$Val extends Bucket> implements $BucketCopyWith<$Res> {
  _$BucketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bucketId = null,Object? title = null,Object? description = null,Object? fileTypes = null,Object? attributes = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_value.copyWith(
bucketId: null == bucketId ? _value.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String,fileTypes: null == fileTypes ? _value.fileTypes : fileTypes // ignore: cast_nullable_to_non_nullable
as List<DocumentType>,attributes: null == attributes ? _value.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<Attribute>,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _value.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  )as $Val);
}

}


/// @nodoc
abstract class _$$BucketImplCopyWith<$Res> implements $BucketCopyWith<$Res> {
  factory _$$BucketImplCopyWith(_$BucketImpl value, $Res Function(_$BucketImpl) then) = __$$BucketImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String bucketId, String title, String description, List<DocumentType> fileTypes, List<Attribute> attributes, DateTime createdAt, DateTime updatedAt
});



}

/// @nodoc
class __$$BucketImplCopyWithImpl<$Res> extends _$BucketCopyWithImpl<$Res, _$BucketImpl> implements _$$BucketImplCopyWith<$Res> {
  __$$BucketImplCopyWithImpl(_$BucketImpl _value, $Res Function(_$BucketImpl) _then)
      : super(_value, _then);


/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bucketId = null,Object? title = null,Object? description = null,Object? fileTypes = null,Object? attributes = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_$BucketImpl(
bucketId: null == bucketId ? _value.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String,fileTypes: null == fileTypes ? _value._fileTypes : fileTypes // ignore: cast_nullable_to_non_nullable
as List<DocumentType>,attributes: null == attributes ? _value._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<Attribute>,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _value.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$BucketImpl  with DiagnosticableTreeMixin implements _Bucket {
  const _$BucketImpl({required this.bucketId, required this.title, required this.description, required final  List<DocumentType> fileTypes, final  List<Attribute> attributes = const [], required this.createdAt, required this.updatedAt}): _fileTypes = fileTypes,_attributes = attributes;

  factory _$BucketImpl.fromJson(Map<String, dynamic> json) => _$$BucketImplFromJson(json);

@override final  String bucketId;
@override final  String title;
@override final  String description;
 final  List<DocumentType> _fileTypes;
@override List<DocumentType> get fileTypes {
  if (_fileTypes is EqualUnmodifiableListView) return _fileTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fileTypes);
}

 final  List<Attribute> _attributes;
@override@JsonKey() List<Attribute> get attributes {
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attributes);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Bucket(bucketId: $bucketId, title: $title, description: $description, fileTypes: $fileTypes, attributes: $attributes, createdAt: $createdAt, updatedAt: $updatedAt)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'Bucket'))
    ..add(DiagnosticsProperty('bucketId', bucketId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('fileTypes', fileTypes))..add(DiagnosticsProperty('attributes', attributes))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$BucketImpl&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._fileTypes, _fileTypes)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucketId,title,description,const DeepCollectionEquality().hash(_fileTypes),const DeepCollectionEquality().hash(_attributes),createdAt,updatedAt);

/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$BucketImplCopyWith<_$BucketImpl> get copyWith => __$$BucketImplCopyWithImpl<_$BucketImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$BucketImplToJson(this, );
}
}


abstract class _Bucket implements Bucket {
  const factory _Bucket({required final  String bucketId, required final  String title, required final  String description, required final  List<DocumentType> fileTypes, final  List<Attribute> attributes, required final  DateTime createdAt, required final  DateTime updatedAt}) = _$BucketImpl;
  

  factory _Bucket.fromJson(Map<String, dynamic> json) = _$BucketImpl.fromJson;

@override String get bucketId;@override String get title;@override String get description;@override List<DocumentType> get fileTypes;@override List<Attribute> get attributes;@override DateTime get createdAt;@override DateTime get updatedAt;
/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$BucketImplCopyWith<_$BucketImpl> get copyWith => throw _privateConstructorUsedError;

}

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
        switch (json['runtimeType']) {
                  case 'text':
          return TextAttribute.fromJson(json);
                case 'dateTime':
          return DateTimeAttribute.fromJson(json);
                case 'singleSelect':
          return SingleSelectAttribute.fromJson(json);
                case 'multiSelect':
          return MultiSelectAttribute.fromJson(json);
        
          default:
            throw CheckedFromJsonException(json, 'runtimeType', 'Attribute', 'Invalid union type "${json['runtimeType']}"!');
        }
      
}

/// @nodoc
mixin _$Attribute {

 String get label => throw _privateConstructorUsedError; String get attributeId => throw _privateConstructorUsedError;
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String label,  String attributeId)  text,required TResult Function( String label,  String attributeId)  dateTime,required TResult Function( String label,  String attributeId,  List<Option> options)  singleSelect,required TResult Function( String label,  String attributeId,  List<Option> options)  multiSelect,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String label,  String attributeId)?  text,TResult? Function( String label,  String attributeId)?  dateTime,TResult? Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult? Function( String label,  String attributeId,  List<Option> options)?  multiSelect,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String label,  String attributeId)?  text,TResult Function( String label,  String attributeId)?  dateTime,TResult Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult Function( String label,  String attributeId,  List<Option> options)?  multiSelect,required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextAttribute value)  text,required TResult Function( DateTimeAttribute value)  dateTime,required TResult Function( SingleSelectAttribute value)  singleSelect,required TResult Function( MultiSelectAttribute value)  multiSelect,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextAttribute value)?  text,TResult? Function( DateTimeAttribute value)?  dateTime,TResult? Function( SingleSelectAttribute value)?  singleSelect,TResult? Function( MultiSelectAttribute value)?  multiSelect,}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextAttribute value)?  text,TResult Function( DateTimeAttribute value)?  dateTime,TResult Function( SingleSelectAttribute value)?  singleSelect,TResult Function( MultiSelectAttribute value)?  multiSelect,required TResult orElse(),}) => throw _privateConstructorUsedError;
/// Serializes this Attribute to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AttributeCopyWith<Attribute> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AttributeCopyWith<$Res>  {
  factory $AttributeCopyWith(Attribute value, $Res Function(Attribute) then) = _$AttributeCopyWithImpl<$Res, Attribute>;
@useResult
$Res call({
 String label, String attributeId
});



}

/// @nodoc
class _$AttributeCopyWithImpl<$Res,$Val extends Attribute> implements $AttributeCopyWith<$Res> {
  _$AttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? attributeId = null,}) {
  return _then(_value.copyWith(
label: null == label ? _value.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: null == attributeId ? _value.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String,
  )as $Val);
}

}


/// @nodoc
abstract class _$$TextAttributeImplCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory _$$TextAttributeImplCopyWith(_$TextAttributeImpl value, $Res Function(_$TextAttributeImpl) then) = __$$TextAttributeImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String label, String attributeId
});



}

/// @nodoc
class __$$TextAttributeImplCopyWithImpl<$Res> extends _$AttributeCopyWithImpl<$Res, _$TextAttributeImpl> implements _$$TextAttributeImplCopyWith<$Res> {
  __$$TextAttributeImplCopyWithImpl(_$TextAttributeImpl _value, $Res Function(_$TextAttributeImpl) _then)
      : super(_value, _then);


/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? attributeId = null,}) {
  return _then(_$TextAttributeImpl(
label: null == label ? _value.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: null == attributeId ? _value.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$TextAttributeImpl  with DiagnosticableTreeMixin implements TextAttribute {
  const _$TextAttributeImpl({required this.label, required this.attributeId, final  String? $type}): $type = $type ?? 'text';

  factory _$TextAttributeImpl.fromJson(Map<String, dynamic> json) => _$$TextAttributeImplFromJson(json);

@override final  String label;
@override final  String attributeId;

@JsonKey(name: 'runtimeType')
final String $type;


@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute.text(label: $label, attributeId: $attributeId)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'Attribute.text'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('attributeId', attributeId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$TextAttributeImpl&&(identical(other.label, label) || other.label == label)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,attributeId);

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$TextAttributeImplCopyWith<_$TextAttributeImpl> get copyWith => __$$TextAttributeImplCopyWithImpl<_$TextAttributeImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String label,  String attributeId)  text,required TResult Function( String label,  String attributeId)  dateTime,required TResult Function( String label,  String attributeId,  List<Option> options)  singleSelect,required TResult Function( String label,  String attributeId,  List<Option> options)  multiSelect,}) {
  return text(label,attributeId);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String label,  String attributeId)?  text,TResult? Function( String label,  String attributeId)?  dateTime,TResult? Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult? Function( String label,  String attributeId,  List<Option> options)?  multiSelect,}) {
  return text?.call(label,attributeId);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String label,  String attributeId)?  text,TResult Function( String label,  String attributeId)?  dateTime,TResult Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult Function( String label,  String attributeId,  List<Option> options)?  multiSelect,required TResult orElse(),}) {
  if (text != null) {
    return text(label,attributeId);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextAttribute value)  text,required TResult Function( DateTimeAttribute value)  dateTime,required TResult Function( SingleSelectAttribute value)  singleSelect,required TResult Function( MultiSelectAttribute value)  multiSelect,}) {
  return text(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextAttribute value)?  text,TResult? Function( DateTimeAttribute value)?  dateTime,TResult? Function( SingleSelectAttribute value)?  singleSelect,TResult? Function( MultiSelectAttribute value)?  multiSelect,}) {
  return text?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextAttribute value)?  text,TResult Function( DateTimeAttribute value)?  dateTime,TResult Function( SingleSelectAttribute value)?  singleSelect,TResult Function( MultiSelectAttribute value)?  multiSelect,required TResult orElse(),}) {
  if (text != null) {
    return text(this);
  }
  return orElse();
}
@override
Map<String, dynamic> toJson() {
  return _$$TextAttributeImplToJson(this, );
}
}


abstract class TextAttribute implements Attribute {
  const factory TextAttribute({required final  String label, required final  String attributeId}) = _$TextAttributeImpl;
  

  factory TextAttribute.fromJson(Map<String, dynamic> json) = _$TextAttributeImpl.fromJson;

@override String get label;@override String get attributeId;
/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$TextAttributeImplCopyWith<_$TextAttributeImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$DateTimeAttributeImplCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory _$$DateTimeAttributeImplCopyWith(_$DateTimeAttributeImpl value, $Res Function(_$DateTimeAttributeImpl) then) = __$$DateTimeAttributeImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String label, String attributeId
});



}

/// @nodoc
class __$$DateTimeAttributeImplCopyWithImpl<$Res> extends _$AttributeCopyWithImpl<$Res, _$DateTimeAttributeImpl> implements _$$DateTimeAttributeImplCopyWith<$Res> {
  __$$DateTimeAttributeImplCopyWithImpl(_$DateTimeAttributeImpl _value, $Res Function(_$DateTimeAttributeImpl) _then)
      : super(_value, _then);


/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? attributeId = null,}) {
  return _then(_$DateTimeAttributeImpl(
label: null == label ? _value.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: null == attributeId ? _value.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$DateTimeAttributeImpl  with DiagnosticableTreeMixin implements DateTimeAttribute {
  const _$DateTimeAttributeImpl({required this.label, required this.attributeId, final  String? $type}): $type = $type ?? 'dateTime';

  factory _$DateTimeAttributeImpl.fromJson(Map<String, dynamic> json) => _$$DateTimeAttributeImplFromJson(json);

@override final  String label;
@override final  String attributeId;

@JsonKey(name: 'runtimeType')
final String $type;


@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute.dateTime(label: $label, attributeId: $attributeId)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'Attribute.dateTime'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('attributeId', attributeId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$DateTimeAttributeImpl&&(identical(other.label, label) || other.label == label)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,attributeId);

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$DateTimeAttributeImplCopyWith<_$DateTimeAttributeImpl> get copyWith => __$$DateTimeAttributeImplCopyWithImpl<_$DateTimeAttributeImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String label,  String attributeId)  text,required TResult Function( String label,  String attributeId)  dateTime,required TResult Function( String label,  String attributeId,  List<Option> options)  singleSelect,required TResult Function( String label,  String attributeId,  List<Option> options)  multiSelect,}) {
  return dateTime(label,attributeId);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String label,  String attributeId)?  text,TResult? Function( String label,  String attributeId)?  dateTime,TResult? Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult? Function( String label,  String attributeId,  List<Option> options)?  multiSelect,}) {
  return dateTime?.call(label,attributeId);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String label,  String attributeId)?  text,TResult Function( String label,  String attributeId)?  dateTime,TResult Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult Function( String label,  String attributeId,  List<Option> options)?  multiSelect,required TResult orElse(),}) {
  if (dateTime != null) {
    return dateTime(label,attributeId);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextAttribute value)  text,required TResult Function( DateTimeAttribute value)  dateTime,required TResult Function( SingleSelectAttribute value)  singleSelect,required TResult Function( MultiSelectAttribute value)  multiSelect,}) {
  return dateTime(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextAttribute value)?  text,TResult? Function( DateTimeAttribute value)?  dateTime,TResult? Function( SingleSelectAttribute value)?  singleSelect,TResult? Function( MultiSelectAttribute value)?  multiSelect,}) {
  return dateTime?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextAttribute value)?  text,TResult Function( DateTimeAttribute value)?  dateTime,TResult Function( SingleSelectAttribute value)?  singleSelect,TResult Function( MultiSelectAttribute value)?  multiSelect,required TResult orElse(),}) {
  if (dateTime != null) {
    return dateTime(this);
  }
  return orElse();
}
@override
Map<String, dynamic> toJson() {
  return _$$DateTimeAttributeImplToJson(this, );
}
}


abstract class DateTimeAttribute implements Attribute {
  const factory DateTimeAttribute({required final  String label, required final  String attributeId}) = _$DateTimeAttributeImpl;
  

  factory DateTimeAttribute.fromJson(Map<String, dynamic> json) = _$DateTimeAttributeImpl.fromJson;

@override String get label;@override String get attributeId;
/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$DateTimeAttributeImplCopyWith<_$DateTimeAttributeImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$SingleSelectAttributeImplCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory _$$SingleSelectAttributeImplCopyWith(_$SingleSelectAttributeImpl value, $Res Function(_$SingleSelectAttributeImpl) then) = __$$SingleSelectAttributeImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String label, String attributeId, List<Option> options
});



}

/// @nodoc
class __$$SingleSelectAttributeImplCopyWithImpl<$Res> extends _$AttributeCopyWithImpl<$Res, _$SingleSelectAttributeImpl> implements _$$SingleSelectAttributeImplCopyWith<$Res> {
  __$$SingleSelectAttributeImplCopyWithImpl(_$SingleSelectAttributeImpl _value, $Res Function(_$SingleSelectAttributeImpl) _then)
      : super(_value, _then);


/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? attributeId = null,Object? options = null,}) {
  return _then(_$SingleSelectAttributeImpl(
label: null == label ? _value.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: null == attributeId ? _value.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _value._options : options // ignore: cast_nullable_to_non_nullable
as List<Option>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$SingleSelectAttributeImpl  with DiagnosticableTreeMixin implements SingleSelectAttribute {
  const _$SingleSelectAttributeImpl({required this.label, required this.attributeId, required final  List<Option> options, final  String? $type}): _options = options,$type = $type ?? 'singleSelect';

  factory _$SingleSelectAttributeImpl.fromJson(Map<String, dynamic> json) => _$$SingleSelectAttributeImplFromJson(json);

@override final  String label;
@override final  String attributeId;
 final  List<Option> _options;
@override List<Option> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


@JsonKey(name: 'runtimeType')
final String $type;


@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute.singleSelect(label: $label, attributeId: $attributeId, options: $options)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'Attribute.singleSelect'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('attributeId', attributeId))..add(DiagnosticsProperty('options', options));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$SingleSelectAttributeImpl&&(identical(other.label, label) || other.label == label)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,attributeId,const DeepCollectionEquality().hash(_options));

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$SingleSelectAttributeImplCopyWith<_$SingleSelectAttributeImpl> get copyWith => __$$SingleSelectAttributeImplCopyWithImpl<_$SingleSelectAttributeImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String label,  String attributeId)  text,required TResult Function( String label,  String attributeId)  dateTime,required TResult Function( String label,  String attributeId,  List<Option> options)  singleSelect,required TResult Function( String label,  String attributeId,  List<Option> options)  multiSelect,}) {
  return singleSelect(label,attributeId,options);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String label,  String attributeId)?  text,TResult? Function( String label,  String attributeId)?  dateTime,TResult? Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult? Function( String label,  String attributeId,  List<Option> options)?  multiSelect,}) {
  return singleSelect?.call(label,attributeId,options);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String label,  String attributeId)?  text,TResult Function( String label,  String attributeId)?  dateTime,TResult Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult Function( String label,  String attributeId,  List<Option> options)?  multiSelect,required TResult orElse(),}) {
  if (singleSelect != null) {
    return singleSelect(label,attributeId,options);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextAttribute value)  text,required TResult Function( DateTimeAttribute value)  dateTime,required TResult Function( SingleSelectAttribute value)  singleSelect,required TResult Function( MultiSelectAttribute value)  multiSelect,}) {
  return singleSelect(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextAttribute value)?  text,TResult? Function( DateTimeAttribute value)?  dateTime,TResult? Function( SingleSelectAttribute value)?  singleSelect,TResult? Function( MultiSelectAttribute value)?  multiSelect,}) {
  return singleSelect?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextAttribute value)?  text,TResult Function( DateTimeAttribute value)?  dateTime,TResult Function( SingleSelectAttribute value)?  singleSelect,TResult Function( MultiSelectAttribute value)?  multiSelect,required TResult orElse(),}) {
  if (singleSelect != null) {
    return singleSelect(this);
  }
  return orElse();
}
@override
Map<String, dynamic> toJson() {
  return _$$SingleSelectAttributeImplToJson(this, );
}
}


abstract class SingleSelectAttribute implements Attribute {
  const factory SingleSelectAttribute({required final  String label, required final  String attributeId, required final  List<Option> options}) = _$SingleSelectAttributeImpl;
  

  factory SingleSelectAttribute.fromJson(Map<String, dynamic> json) = _$SingleSelectAttributeImpl.fromJson;

@override String get label;@override String get attributeId; List<Option> get options;
/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$SingleSelectAttributeImplCopyWith<_$SingleSelectAttributeImpl> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class _$$MultiSelectAttributeImplCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory _$$MultiSelectAttributeImplCopyWith(_$MultiSelectAttributeImpl value, $Res Function(_$MultiSelectAttributeImpl) then) = __$$MultiSelectAttributeImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String label, String attributeId, List<Option> options
});



}

/// @nodoc
class __$$MultiSelectAttributeImplCopyWithImpl<$Res> extends _$AttributeCopyWithImpl<$Res, _$MultiSelectAttributeImpl> implements _$$MultiSelectAttributeImplCopyWith<$Res> {
  __$$MultiSelectAttributeImplCopyWithImpl(_$MultiSelectAttributeImpl _value, $Res Function(_$MultiSelectAttributeImpl) _then)
      : super(_value, _then);


/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? attributeId = null,Object? options = null,}) {
  return _then(_$MultiSelectAttributeImpl(
label: null == label ? _value.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: null == attributeId ? _value.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _value._options : options // ignore: cast_nullable_to_non_nullable
as List<Option>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$MultiSelectAttributeImpl  with DiagnosticableTreeMixin implements MultiSelectAttribute {
  const _$MultiSelectAttributeImpl({required this.label, required this.attributeId, required final  List<Option> options, final  String? $type}): _options = options,$type = $type ?? 'multiSelect';

  factory _$MultiSelectAttributeImpl.fromJson(Map<String, dynamic> json) => _$$MultiSelectAttributeImplFromJson(json);

@override final  String label;
@override final  String attributeId;
 final  List<Option> _options;
@override List<Option> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


@JsonKey(name: 'runtimeType')
final String $type;


@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute.multiSelect(label: $label, attributeId: $attributeId, options: $options)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'Attribute.multiSelect'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('attributeId', attributeId))..add(DiagnosticsProperty('options', options));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$MultiSelectAttributeImpl&&(identical(other.label, label) || other.label == label)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,attributeId,const DeepCollectionEquality().hash(_options));

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$MultiSelectAttributeImplCopyWith<_$MultiSelectAttributeImpl> get copyWith => __$$MultiSelectAttributeImplCopyWithImpl<_$MultiSelectAttributeImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String label,  String attributeId)  text,required TResult Function( String label,  String attributeId)  dateTime,required TResult Function( String label,  String attributeId,  List<Option> options)  singleSelect,required TResult Function( String label,  String attributeId,  List<Option> options)  multiSelect,}) {
  return multiSelect(label,attributeId,options);
}
@override
@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String label,  String attributeId)?  text,TResult? Function( String label,  String attributeId)?  dateTime,TResult? Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult? Function( String label,  String attributeId,  List<Option> options)?  multiSelect,}) {
  return multiSelect?.call(label,attributeId,options);
}
@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String label,  String attributeId)?  text,TResult Function( String label,  String attributeId)?  dateTime,TResult Function( String label,  String attributeId,  List<Option> options)?  singleSelect,TResult Function( String label,  String attributeId,  List<Option> options)?  multiSelect,required TResult orElse(),}) {
  if (multiSelect != null) {
    return multiSelect(label,attributeId,options);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextAttribute value)  text,required TResult Function( DateTimeAttribute value)  dateTime,required TResult Function( SingleSelectAttribute value)  singleSelect,required TResult Function( MultiSelectAttribute value)  multiSelect,}) {
  return multiSelect(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextAttribute value)?  text,TResult? Function( DateTimeAttribute value)?  dateTime,TResult? Function( SingleSelectAttribute value)?  singleSelect,TResult? Function( MultiSelectAttribute value)?  multiSelect,}) {
  return multiSelect?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextAttribute value)?  text,TResult Function( DateTimeAttribute value)?  dateTime,TResult Function( SingleSelectAttribute value)?  singleSelect,TResult Function( MultiSelectAttribute value)?  multiSelect,required TResult orElse(),}) {
  if (multiSelect != null) {
    return multiSelect(this);
  }
  return orElse();
}
@override
Map<String, dynamic> toJson() {
  return _$$MultiSelectAttributeImplToJson(this, );
}
}


abstract class MultiSelectAttribute implements Attribute {
  const factory MultiSelectAttribute({required final  String label, required final  String attributeId, required final  List<Option> options}) = _$MultiSelectAttributeImpl;
  

  factory MultiSelectAttribute.fromJson(Map<String, dynamic> json) = _$MultiSelectAttributeImpl.fromJson;

@override String get label;@override String get attributeId; List<Option> get options;
/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$MultiSelectAttributeImplCopyWith<_$MultiSelectAttributeImpl> get copyWith => throw _privateConstructorUsedError;

}

Option _$OptionFromJson(Map<String, dynamic> json) {
return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {

 String get id => throw _privateConstructorUsedError; String get value => throw _privateConstructorUsedError;






/// Serializes this Option to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $OptionCopyWith<$Res>  {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) = _$OptionCopyWithImpl<$Res, Option>;
@useResult
$Res call({
 String id, String value
});



}

/// @nodoc
class _$OptionCopyWithImpl<$Res,$Val extends Option> implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? value = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _value.value : value // ignore: cast_nullable_to_non_nullable
as String,
  )as $Val);
}

}


/// @nodoc
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(_$OptionImpl value, $Res Function(_$OptionImpl) then) = __$$OptionImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String id, String value
});



}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res> extends _$OptionCopyWithImpl<$Res, _$OptionImpl> implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(_$OptionImpl _value, $Res Function(_$OptionImpl) _then)
      : super(_value, _then);


/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? value = null,}) {
  return _then(_$OptionImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _value.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$OptionImpl  with DiagnosticableTreeMixin implements _Option {
  const _$OptionImpl({required this.id, required this.value});

  factory _$OptionImpl.fromJson(Map<String, dynamic> json) => _$$OptionImplFromJson(json);

@override final  String id;
@override final  String value;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Option(id: $id, value: $value)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'Option'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('value', value));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$OptionImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$OptionImplCopyWith<_$OptionImpl> get copyWith => __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$OptionImplToJson(this, );
}
}


abstract class _Option implements Option {
  const factory _Option({required final  String id, required final  String value}) = _$OptionImpl;
  

  factory _Option.fromJson(Map<String, dynamic> json) = _$OptionImpl.fromJson;

@override String get id;@override String get value;
/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$OptionImplCopyWith<_$OptionImpl> get copyWith => throw _privateConstructorUsedError;

}

DocumentFile _$DocumentFileFromJson(Map<String, dynamic> json) {
return _DocumentFile.fromJson(json);
}

/// @nodoc
mixin _$DocumentFile {

 String get fileId => throw _privateConstructorUsedError; String get orgId => throw _privateConstructorUsedError; String get bucketId => throw _privateConstructorUsedError; String get name => throw _privateConstructorUsedError; String get fileUrl => throw _privateConstructorUsedError; DateTime get uploadedAt => throw _privateConstructorUsedError; DateTime get updatedAt => throw _privateConstructorUsedError; Map<String, dynamic> get attributes => throw _privateConstructorUsedError;






/// Serializes this DocumentFile to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$DocumentFileCopyWith<DocumentFile> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $DocumentFileCopyWith<$Res>  {
  factory $DocumentFileCopyWith(DocumentFile value, $Res Function(DocumentFile) then) = _$DocumentFileCopyWithImpl<$Res, DocumentFile>;
@useResult
$Res call({
 String fileId, String orgId, String bucketId, String name, String fileUrl, DateTime uploadedAt, DateTime updatedAt, Map<String, dynamic> attributes
});



}

/// @nodoc
class _$DocumentFileCopyWithImpl<$Res,$Val extends DocumentFile> implements $DocumentFileCopyWith<$Res> {
  _$DocumentFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileId = null,Object? orgId = null,Object? bucketId = null,Object? name = null,Object? fileUrl = null,Object? uploadedAt = null,Object? updatedAt = null,Object? attributes = null,}) {
  return _then(_value.copyWith(
fileId: null == fileId ? _value.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _value.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,bucketId: null == bucketId ? _value.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,fileUrl: null == fileUrl ? _value.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _value.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _value.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,attributes: null == attributes ? _value.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  )as $Val);
}

}


/// @nodoc
abstract class _$$DocumentFileImplCopyWith<$Res> implements $DocumentFileCopyWith<$Res> {
  factory _$$DocumentFileImplCopyWith(_$DocumentFileImpl value, $Res Function(_$DocumentFileImpl) then) = __$$DocumentFileImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String fileId, String orgId, String bucketId, String name, String fileUrl, DateTime uploadedAt, DateTime updatedAt, Map<String, dynamic> attributes
});



}

/// @nodoc
class __$$DocumentFileImplCopyWithImpl<$Res> extends _$DocumentFileCopyWithImpl<$Res, _$DocumentFileImpl> implements _$$DocumentFileImplCopyWith<$Res> {
  __$$DocumentFileImplCopyWithImpl(_$DocumentFileImpl _value, $Res Function(_$DocumentFileImpl) _then)
      : super(_value, _then);


/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileId = null,Object? orgId = null,Object? bucketId = null,Object? name = null,Object? fileUrl = null,Object? uploadedAt = null,Object? updatedAt = null,Object? attributes = null,}) {
  return _then(_$DocumentFileImpl(
fileId: null == fileId ? _value.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _value.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,bucketId: null == bucketId ? _value.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,fileUrl: null == fileUrl ? _value.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _value.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _value.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,attributes: null == attributes ? _value._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$DocumentFileImpl extends _DocumentFile  with DiagnosticableTreeMixin {
  const _$DocumentFileImpl({required this.fileId, required this.orgId, required this.bucketId, required this.name, required this.fileUrl, required this.uploadedAt, required this.updatedAt, final  Map<String, dynamic> attributes = const {}}): _attributes = attributes,super._();

  factory _$DocumentFileImpl.fromJson(Map<String, dynamic> json) => _$$DocumentFileImplFromJson(json);

@override final  String fileId;
@override final  String orgId;
@override final  String bucketId;
@override final  String name;
@override final  String fileUrl;
@override final  DateTime uploadedAt;
@override final  DateTime updatedAt;
 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentFile(fileId: $fileId, orgId: $orgId, bucketId: $bucketId, name: $name, fileUrl: $fileUrl, uploadedAt: $uploadedAt, updatedAt: $updatedAt, attributes: $attributes)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'DocumentFile'))
    ..add(DiagnosticsProperty('fileId', fileId))..add(DiagnosticsProperty('orgId', orgId))..add(DiagnosticsProperty('bucketId', bucketId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('fileUrl', fileUrl))..add(DiagnosticsProperty('uploadedAt', uploadedAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('attributes', attributes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$DocumentFileImpl&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,orgId,bucketId,name,fileUrl,uploadedAt,updatedAt,const DeepCollectionEquality().hash(_attributes));

/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$DocumentFileImplCopyWith<_$DocumentFileImpl> get copyWith => __$$DocumentFileImplCopyWithImpl<_$DocumentFileImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$DocumentFileImplToJson(this, );
}
}


abstract class _DocumentFile extends DocumentFile {
  const factory _DocumentFile({required final  String fileId, required final  String orgId, required final  String bucketId, required final  String name, required final  String fileUrl, required final  DateTime uploadedAt, required final  DateTime updatedAt, final  Map<String, dynamic> attributes}) = _$DocumentFileImpl;
  const _DocumentFile._(): super._();

  factory _DocumentFile.fromJson(Map<String, dynamic> json) = _$DocumentFileImpl.fromJson;

@override String get fileId;@override String get orgId;@override String get bucketId;@override String get name;@override String get fileUrl;@override DateTime get uploadedAt;@override DateTime get updatedAt;@override Map<String, dynamic> get attributes;
/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$DocumentFileImplCopyWith<_$DocumentFileImpl> get copyWith => throw _privateConstructorUsedError;

}
