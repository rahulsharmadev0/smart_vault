// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Organization implements DiagnosticableTreeMixin {

 String get orgId; DateTime get createdAt; DateTime get updatedAt; String get email; String get name; String? get description;
/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationCopyWith<Organization> get copyWith => _$OrganizationCopyWithImpl<Organization>(this as Organization, _$identity);

  /// Serializes this Organization to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Organization'))
    ..add(DiagnosticsProperty('orgId', orgId))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('description', description));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Organization&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,createdAt,updatedAt,email,name,description);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Organization(orgId: $orgId, createdAt: $createdAt, updatedAt: $updatedAt, email: $email, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $OrganizationCopyWith<$Res>  {
  factory $OrganizationCopyWith(Organization value, $Res Function(Organization) _then) = _$OrganizationCopyWithImpl;
@useResult
$Res call({
 String? orgId, String email, String name, DateTime? createdAt, DateTime? updatedAt, String? description
});




}
/// @nodoc
class _$OrganizationCopyWithImpl<$Res>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._self, this._then);

  final Organization _self;
  final $Res Function(Organization) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = freezed,Object? email = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
orgId: freezed == orgId ? _self.orgId! : orgId // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt! : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt! : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Organization extends Organization with DiagnosticableTreeMixin {
   _Organization({final  String? orgId, required this.email, required this.name, final  DateTime? createdAt, final  DateTime? updatedAt, this.description}): super._(orgId: orgId, createdAt: createdAt, updatedAt: updatedAt);
  factory _Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

@override final  String email;
@override final  String name;
@override final  String? description;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationCopyWith<_Organization> get copyWith => __$OrganizationCopyWithImpl<_Organization>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrganizationToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Organization'))
    ..add(DiagnosticsProperty('orgId', orgId))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('description', description));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Organization&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,email,name,createdAt,updatedAt,description);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Organization(orgId: $orgId, email: $email, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
}


}

/// @nodoc
abstract mixin class _$OrganizationCopyWith<$Res> implements $OrganizationCopyWith<$Res> {
  factory _$OrganizationCopyWith(_Organization value, $Res Function(_Organization) _then) = __$OrganizationCopyWithImpl;
@override @useResult
$Res call({
 String? orgId, String email, String name, DateTime? createdAt, DateTime? updatedAt, String? description
});




}
/// @nodoc
class __$OrganizationCopyWithImpl<$Res>
    implements _$OrganizationCopyWith<$Res> {
  __$OrganizationCopyWithImpl(this._self, this._then);

  final _Organization _self;
  final $Res Function(_Organization) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = freezed,Object? email = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? description = freezed,}) {
  return _then(_Organization(
orgId: freezed == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Bucket implements DiagnosticableTreeMixin {

 String get bucketId; DateTime get createdAt; DateTime get updatedAt; String get orgId; String get title; String get description; List<DocumentType> get fileTypes; List<Attribute> get attributes;
/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BucketCopyWith<Bucket> get copyWith => _$BucketCopyWithImpl<Bucket>(this as Bucket, _$identity);

  /// Serializes this Bucket to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Bucket'))
    ..add(DiagnosticsProperty('bucketId', bucketId))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('orgId', orgId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('fileTypes', fileTypes))..add(DiagnosticsProperty('attributes', attributes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bucket&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.fileTypes, fileTypes)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucketId,createdAt,updatedAt,orgId,title,description,const DeepCollectionEquality().hash(fileTypes),const DeepCollectionEquality().hash(attributes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Bucket(bucketId: $bucketId, createdAt: $createdAt, updatedAt: $updatedAt, orgId: $orgId, title: $title, description: $description, fileTypes: $fileTypes, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $BucketCopyWith<$Res>  {
  factory $BucketCopyWith(Bucket value, $Res Function(Bucket) _then) = _$BucketCopyWithImpl;
@useResult
$Res call({
 String? bucketId, String orgId, String title, String description, List<DocumentType> fileTypes, List<Attribute> attributes, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$BucketCopyWithImpl<$Res>
    implements $BucketCopyWith<$Res> {
  _$BucketCopyWithImpl(this._self, this._then);

  final Bucket _self;
  final $Res Function(Bucket) _then;

/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bucketId = freezed,Object? orgId = null,Object? title = null,Object? description = null,Object? fileTypes = null,Object? attributes = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
bucketId: freezed == bucketId ? _self.bucketId! : bucketId // ignore: cast_nullable_to_non_nullable
as String?,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fileTypes: null == fileTypes ? _self.fileTypes : fileTypes // ignore: cast_nullable_to_non_nullable
as List<DocumentType>,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<Attribute>,createdAt: freezed == createdAt ? _self.createdAt! : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt! : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Bucket extends Bucket with DiagnosticableTreeMixin {
   _Bucket({final  String? bucketId, required this.orgId, required this.title, required this.description, required final  List<DocumentType> fileTypes, final  List<Attribute> attributes = const [], final  DateTime? createdAt, final  DateTime? updatedAt}): _fileTypes = fileTypes,_attributes = attributes,super._(bucketId: bucketId, createdAt: createdAt, updatedAt: updatedAt);
  factory _Bucket.fromJson(Map<String, dynamic> json) => _$BucketFromJson(json);

@override final  String orgId;
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


/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BucketCopyWith<_Bucket> get copyWith => __$BucketCopyWithImpl<_Bucket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BucketToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Bucket'))
    ..add(DiagnosticsProperty('bucketId', bucketId))..add(DiagnosticsProperty('orgId', orgId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('fileTypes', fileTypes))..add(DiagnosticsProperty('attributes', attributes))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bucket&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._fileTypes, _fileTypes)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucketId,orgId,title,description,const DeepCollectionEquality().hash(_fileTypes),const DeepCollectionEquality().hash(_attributes),createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Bucket(bucketId: $bucketId, orgId: $orgId, title: $title, description: $description, fileTypes: $fileTypes, attributes: $attributes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BucketCopyWith<$Res> implements $BucketCopyWith<$Res> {
  factory _$BucketCopyWith(_Bucket value, $Res Function(_Bucket) _then) = __$BucketCopyWithImpl;
@override @useResult
$Res call({
 String? bucketId, String orgId, String title, String description, List<DocumentType> fileTypes, List<Attribute> attributes, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$BucketCopyWithImpl<$Res>
    implements _$BucketCopyWith<$Res> {
  __$BucketCopyWithImpl(this._self, this._then);

  final _Bucket _self;
  final $Res Function(_Bucket) _then;

/// Create a copy of Bucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bucketId = freezed,Object? orgId = null,Object? title = null,Object? description = null,Object? fileTypes = null,Object? attributes = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Bucket(
bucketId: freezed == bucketId ? _self.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String?,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fileTypes: null == fileTypes ? _self._fileTypes : fileTypes // ignore: cast_nullable_to_non_nullable
as List<DocumentType>,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<Attribute>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

Attribute _$AttributeFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'text':
          return TextAttribute.fromJson(
            json
          );
                case 'dateTime':
          return DateTimeAttribute.fromJson(
            json
          );
                case 'singleSelect':
          return SingleSelectAttribute.fromJson(
            json
          );
                case 'multiSelect':
          return MultiSelectAttribute.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Attribute',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Attribute implements DiagnosticableTreeMixin {

 String get attributeId; String get label;
/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeCopyWith<Attribute> get copyWith => _$AttributeCopyWithImpl<Attribute>(this as Attribute, _$identity);

  /// Serializes this Attribute to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Attribute'))
    ..add(DiagnosticsProperty('attributeId', attributeId))..add(DiagnosticsProperty('label', label));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attribute&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeId,label);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute(attributeId: $attributeId, label: $label)';
}


}

/// @nodoc
abstract mixin class $AttributeCopyWith<$Res>  {
  factory $AttributeCopyWith(Attribute value, $Res Function(Attribute) _then) = _$AttributeCopyWithImpl;
@useResult
$Res call({
 String label, String? attributeId
});




}
/// @nodoc
class _$AttributeCopyWithImpl<$Res>
    implements $AttributeCopyWith<$Res> {
  _$AttributeCopyWithImpl(this._self, this._then);

  final Attribute _self;
  final $Res Function(Attribute) _then;

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? attributeId = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: freezed == attributeId ? _self.attributeId! : attributeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class TextAttribute extends Attribute with DiagnosticableTreeMixin {
   TextAttribute({required this.label, final  String? attributeId, final  String? $type}): $type = $type ?? 'text',super._(attributeId: attributeId);
  factory TextAttribute.fromJson(Map<String, dynamic> json) => _$TextAttributeFromJson(json);

@override final  String label;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextAttributeCopyWith<TextAttribute> get copyWith => _$TextAttributeCopyWithImpl<TextAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextAttributeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Attribute.text'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('attributeId', attributeId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextAttribute&&(identical(other.label, label) || other.label == label)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,attributeId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute.text(label: $label, attributeId: $attributeId)';
}


}

/// @nodoc
abstract mixin class $TextAttributeCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory $TextAttributeCopyWith(TextAttribute value, $Res Function(TextAttribute) _then) = _$TextAttributeCopyWithImpl;
@override @useResult
$Res call({
 String label, String? attributeId
});




}
/// @nodoc
class _$TextAttributeCopyWithImpl<$Res>
    implements $TextAttributeCopyWith<$Res> {
  _$TextAttributeCopyWithImpl(this._self, this._then);

  final TextAttribute _self;
  final $Res Function(TextAttribute) _then;

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? attributeId = freezed,}) {
  return _then(TextAttribute(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: freezed == attributeId ? _self.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DateTimeAttribute extends Attribute with DiagnosticableTreeMixin {
   DateTimeAttribute({required this.label, final  String? attributeId, final  String? $type}): $type = $type ?? 'dateTime',super._(attributeId: attributeId);
  factory DateTimeAttribute.fromJson(Map<String, dynamic> json) => _$DateTimeAttributeFromJson(json);

@override final  String label;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateTimeAttributeCopyWith<DateTimeAttribute> get copyWith => _$DateTimeAttributeCopyWithImpl<DateTimeAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DateTimeAttributeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Attribute.dateTime'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('attributeId', attributeId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateTimeAttribute&&(identical(other.label, label) || other.label == label)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,attributeId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute.dateTime(label: $label, attributeId: $attributeId)';
}


}

/// @nodoc
abstract mixin class $DateTimeAttributeCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory $DateTimeAttributeCopyWith(DateTimeAttribute value, $Res Function(DateTimeAttribute) _then) = _$DateTimeAttributeCopyWithImpl;
@override @useResult
$Res call({
 String label, String? attributeId
});




}
/// @nodoc
class _$DateTimeAttributeCopyWithImpl<$Res>
    implements $DateTimeAttributeCopyWith<$Res> {
  _$DateTimeAttributeCopyWithImpl(this._self, this._then);

  final DateTimeAttribute _self;
  final $Res Function(DateTimeAttribute) _then;

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? attributeId = freezed,}) {
  return _then(DateTimeAttribute(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: freezed == attributeId ? _self.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SingleSelectAttribute extends Attribute with DiagnosticableTreeMixin {
   SingleSelectAttribute({required this.label, final  String? attributeId, required final  List<Option> options, final  String? $type}): _options = options,$type = $type ?? 'singleSelect',super._(attributeId: attributeId);
  factory SingleSelectAttribute.fromJson(Map<String, dynamic> json) => _$SingleSelectAttributeFromJson(json);

@override final  String label;
 final  List<Option> _options;
 List<Option> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingleSelectAttributeCopyWith<SingleSelectAttribute> get copyWith => _$SingleSelectAttributeCopyWithImpl<SingleSelectAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingleSelectAttributeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Attribute.singleSelect'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('attributeId', attributeId))..add(DiagnosticsProperty('options', options));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleSelectAttribute&&(identical(other.label, label) || other.label == label)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,attributeId,const DeepCollectionEquality().hash(_options));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute.singleSelect(label: $label, attributeId: $attributeId, options: $options)';
}


}

/// @nodoc
abstract mixin class $SingleSelectAttributeCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory $SingleSelectAttributeCopyWith(SingleSelectAttribute value, $Res Function(SingleSelectAttribute) _then) = _$SingleSelectAttributeCopyWithImpl;
@override @useResult
$Res call({
 String label, String? attributeId, List<Option> options
});




}
/// @nodoc
class _$SingleSelectAttributeCopyWithImpl<$Res>
    implements $SingleSelectAttributeCopyWith<$Res> {
  _$SingleSelectAttributeCopyWithImpl(this._self, this._then);

  final SingleSelectAttribute _self;
  final $Res Function(SingleSelectAttribute) _then;

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? attributeId = freezed,Object? options = null,}) {
  return _then(SingleSelectAttribute(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: freezed == attributeId ? _self.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<Option>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MultiSelectAttribute extends Attribute with DiagnosticableTreeMixin {
   MultiSelectAttribute({required this.label, final  String? attributeId, required final  List<Option> options, final  String? $type}): _options = options,$type = $type ?? 'multiSelect',super._(attributeId: attributeId);
  factory MultiSelectAttribute.fromJson(Map<String, dynamic> json) => _$MultiSelectAttributeFromJson(json);

@override final  String label;
 final  List<Option> _options;
 List<Option> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultiSelectAttributeCopyWith<MultiSelectAttribute> get copyWith => _$MultiSelectAttributeCopyWithImpl<MultiSelectAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MultiSelectAttributeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Attribute.multiSelect'))
    ..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('attributeId', attributeId))..add(DiagnosticsProperty('options', options));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultiSelectAttribute&&(identical(other.label, label) || other.label == label)&&(identical(other.attributeId, attributeId) || other.attributeId == attributeId)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,attributeId,const DeepCollectionEquality().hash(_options));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Attribute.multiSelect(label: $label, attributeId: $attributeId, options: $options)';
}


}

/// @nodoc
abstract mixin class $MultiSelectAttributeCopyWith<$Res> implements $AttributeCopyWith<$Res> {
  factory $MultiSelectAttributeCopyWith(MultiSelectAttribute value, $Res Function(MultiSelectAttribute) _then) = _$MultiSelectAttributeCopyWithImpl;
@override @useResult
$Res call({
 String label, String? attributeId, List<Option> options
});




}
/// @nodoc
class _$MultiSelectAttributeCopyWithImpl<$Res>
    implements $MultiSelectAttributeCopyWith<$Res> {
  _$MultiSelectAttributeCopyWithImpl(this._self, this._then);

  final MultiSelectAttribute _self;
  final $Res Function(MultiSelectAttribute) _then;

/// Create a copy of Attribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? attributeId = freezed,Object? options = null,}) {
  return _then(MultiSelectAttribute(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,attributeId: freezed == attributeId ? _self.attributeId : attributeId // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<Option>,
  ));
}


}


/// @nodoc
mixin _$Option implements DiagnosticableTreeMixin {

 String get id; String get value;
/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionCopyWith<Option> get copyWith => _$OptionCopyWithImpl<Option>(this as Option, _$identity);

  /// Serializes this Option to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Option'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('value', value));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Option&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Option(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class $OptionCopyWith<$Res>  {
  factory $OptionCopyWith(Option value, $Res Function(Option) _then) = _$OptionCopyWithImpl;
@useResult
$Res call({
 String? id, String value
});




}
/// @nodoc
class _$OptionCopyWithImpl<$Res>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._self, this._then);

  final Option _self;
  final $Res Function(Option) _then;

/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? value = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id! : id // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Option extends Option with DiagnosticableTreeMixin {
   _Option({final  String? id, required this.value}): super._(id: id);
  factory _Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

@override final  String value;

/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionCopyWith<_Option> get copyWith => __$OptionCopyWithImpl<_Option>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptionToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Option'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('value', value));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Option&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Option(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class _$OptionCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$OptionCopyWith(_Option value, $Res Function(_Option) _then) = __$OptionCopyWithImpl;
@override @useResult
$Res call({
 String? id, String value
});




}
/// @nodoc
class __$OptionCopyWithImpl<$Res>
    implements _$OptionCopyWith<$Res> {
  __$OptionCopyWithImpl(this._self, this._then);

  final _Option _self;
  final $Res Function(_Option) _then;

/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? value = null,}) {
  return _then(_Option(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DocumentFile implements DiagnosticableTreeMixin {

 String get fileId; DateTime get uploadedAt; DateTime get updatedAt; String get orgId; String get bucketId; String get name; String get fileUrl; DocumentType get type; String? get description; Map<String, dynamic> get attributes;
/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentFileCopyWith<DocumentFile> get copyWith => _$DocumentFileCopyWithImpl<DocumentFile>(this as DocumentFile, _$identity);

  /// Serializes this DocumentFile to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentFile'))
    ..add(DiagnosticsProperty('fileId', fileId))..add(DiagnosticsProperty('uploadedAt', uploadedAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('orgId', orgId))..add(DiagnosticsProperty('bucketId', bucketId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('fileUrl', fileUrl))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('attributes', attributes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentFile&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,uploadedAt,updatedAt,orgId,bucketId,name,fileUrl,type,description,const DeepCollectionEquality().hash(attributes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentFile(fileId: $fileId, uploadedAt: $uploadedAt, updatedAt: $updatedAt, orgId: $orgId, bucketId: $bucketId, name: $name, fileUrl: $fileUrl, type: $type, description: $description, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $DocumentFileCopyWith<$Res>  {
  factory $DocumentFileCopyWith(DocumentFile value, $Res Function(DocumentFile) _then) = _$DocumentFileCopyWithImpl;
@useResult
$Res call({
 String orgId, String bucketId, String name, String fileUrl, DocumentType type, String? description, String? fileId, DateTime? uploadedAt, DateTime? updatedAt, Map<String, dynamic> attributes
});




}
/// @nodoc
class _$DocumentFileCopyWithImpl<$Res>
    implements $DocumentFileCopyWith<$Res> {
  _$DocumentFileCopyWithImpl(this._self, this._then);

  final DocumentFile _self;
  final $Res Function(DocumentFile) _then;

/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = null,Object? bucketId = null,Object? name = null,Object? fileUrl = null,Object? type = null,Object? description = freezed,Object? fileId = freezed,Object? uploadedAt = freezed,Object? updatedAt = freezed,Object? attributes = null,}) {
  return _then(_self.copyWith(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,bucketId: null == bucketId ? _self.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DocumentType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fileId: freezed == fileId ? _self.fileId! : fileId // ignore: cast_nullable_to_non_nullable
as String?,uploadedAt: freezed == uploadedAt ? _self.uploadedAt! : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt! : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DocumentFile extends DocumentFile with DiagnosticableTreeMixin {
   _DocumentFile({required this.orgId, required this.bucketId, required this.name, required this.fileUrl, required this.type, this.description, final  String? fileId, final  DateTime? uploadedAt, final  DateTime? updatedAt, final  Map<String, dynamic> attributes = const {}}): _attributes = attributes,super._(fileId: fileId, uploadedAt: uploadedAt, updatedAt: updatedAt);
  factory _DocumentFile.fromJson(Map<String, dynamic> json) => _$DocumentFileFromJson(json);

@override final  String orgId;
@override final  String bucketId;
@override final  String name;
@override final  String fileUrl;
@override final  DocumentType type;
@override final  String? description;
 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentFileCopyWith<_DocumentFile> get copyWith => __$DocumentFileCopyWithImpl<_DocumentFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentFileToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DocumentFile'))
    ..add(DiagnosticsProperty('orgId', orgId))..add(DiagnosticsProperty('bucketId', bucketId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('fileUrl', fileUrl))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('fileId', fileId))..add(DiagnosticsProperty('uploadedAt', uploadedAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('attributes', attributes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentFile&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,bucketId,name,fileUrl,type,description,fileId,uploadedAt,updatedAt,const DeepCollectionEquality().hash(_attributes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DocumentFile(orgId: $orgId, bucketId: $bucketId, name: $name, fileUrl: $fileUrl, type: $type, description: $description, fileId: $fileId, uploadedAt: $uploadedAt, updatedAt: $updatedAt, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$DocumentFileCopyWith<$Res> implements $DocumentFileCopyWith<$Res> {
  factory _$DocumentFileCopyWith(_DocumentFile value, $Res Function(_DocumentFile) _then) = __$DocumentFileCopyWithImpl;
@override @useResult
$Res call({
 String orgId, String bucketId, String name, String fileUrl, DocumentType type, String? description, String? fileId, DateTime? uploadedAt, DateTime? updatedAt, Map<String, dynamic> attributes
});




}
/// @nodoc
class __$DocumentFileCopyWithImpl<$Res>
    implements _$DocumentFileCopyWith<$Res> {
  __$DocumentFileCopyWithImpl(this._self, this._then);

  final _DocumentFile _self;
  final $Res Function(_DocumentFile) _then;

/// Create a copy of DocumentFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = null,Object? bucketId = null,Object? name = null,Object? fileUrl = null,Object? type = null,Object? description = freezed,Object? fileId = freezed,Object? uploadedAt = freezed,Object? updatedAt = freezed,Object? attributes = null,}) {
  return _then(_DocumentFile(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,bucketId: null == bucketId ? _self.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DocumentType,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String?,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
