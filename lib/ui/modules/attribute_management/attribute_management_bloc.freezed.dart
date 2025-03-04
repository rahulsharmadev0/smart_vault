// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attribute_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttributeManagementEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeManagementEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttributeManagementEvent()';
}


}

/// @nodoc
class $AttributeManagementEventCopyWith<$Res>  {
$AttributeManagementEventCopyWith(AttributeManagementEvent _, $Res Function(AttributeManagementEvent) __);
}


/// @nodoc


class _Init implements AttributeManagementEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttributeManagementEvent._init()';
}


}




/// @nodoc


class _AddAttribute implements AttributeManagementEvent {
  const _AddAttribute(this.attribute);
  

 final  Attribute attribute;

/// Create a copy of AttributeManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddAttributeCopyWith<_AddAttribute> get copyWith => __$AddAttributeCopyWithImpl<_AddAttribute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddAttribute&&(identical(other.attribute, attribute) || other.attribute == attribute));
}


@override
int get hashCode => Object.hash(runtimeType,attribute);

@override
String toString() {
  return 'AttributeManagementEvent.add(attribute: $attribute)';
}


}

/// @nodoc
abstract mixin class _$AddAttributeCopyWith<$Res> implements $AttributeManagementEventCopyWith<$Res> {
  factory _$AddAttributeCopyWith(_AddAttribute value, $Res Function(_AddAttribute) _then) = __$AddAttributeCopyWithImpl;
@useResult
$Res call({
 Attribute attribute
});


$AttributeCopyWith<$Res> get attribute;

}
/// @nodoc
class __$AddAttributeCopyWithImpl<$Res>
    implements _$AddAttributeCopyWith<$Res> {
  __$AddAttributeCopyWithImpl(this._self, this._then);

  final _AddAttribute _self;
  final $Res Function(_AddAttribute) _then;

/// Create a copy of AttributeManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attribute = null,}) {
  return _then(_AddAttribute(
null == attribute ? _self.attribute : attribute // ignore: cast_nullable_to_non_nullable
as Attribute,
  ));
}

/// Create a copy of AttributeManagementEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttributeCopyWith<$Res> get attribute {
  
  return $AttributeCopyWith<$Res>(_self.attribute, (value) {
    return _then(_self.copyWith(attribute: value));
  });
}
}

/// @nodoc


class _UpdateAttribute implements AttributeManagementEvent {
  const _UpdateAttribute(this.attribute);
  

 final  Attribute attribute;

/// Create a copy of AttributeManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAttributeCopyWith<_UpdateAttribute> get copyWith => __$UpdateAttributeCopyWithImpl<_UpdateAttribute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAttribute&&(identical(other.attribute, attribute) || other.attribute == attribute));
}


@override
int get hashCode => Object.hash(runtimeType,attribute);

@override
String toString() {
  return 'AttributeManagementEvent.update(attribute: $attribute)';
}


}

/// @nodoc
abstract mixin class _$UpdateAttributeCopyWith<$Res> implements $AttributeManagementEventCopyWith<$Res> {
  factory _$UpdateAttributeCopyWith(_UpdateAttribute value, $Res Function(_UpdateAttribute) _then) = __$UpdateAttributeCopyWithImpl;
@useResult
$Res call({
 Attribute attribute
});


$AttributeCopyWith<$Res> get attribute;

}
/// @nodoc
class __$UpdateAttributeCopyWithImpl<$Res>
    implements _$UpdateAttributeCopyWith<$Res> {
  __$UpdateAttributeCopyWithImpl(this._self, this._then);

  final _UpdateAttribute _self;
  final $Res Function(_UpdateAttribute) _then;

/// Create a copy of AttributeManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attribute = null,}) {
  return _then(_UpdateAttribute(
null == attribute ? _self.attribute : attribute // ignore: cast_nullable_to_non_nullable
as Attribute,
  ));
}

/// Create a copy of AttributeManagementEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttributeCopyWith<$Res> get attribute {
  
  return $AttributeCopyWith<$Res>(_self.attribute, (value) {
    return _then(_self.copyWith(attribute: value));
  });
}
}

/// @nodoc


class _RemoveAttribute implements AttributeManagementEvent {
  const _RemoveAttribute(this.index);
  

 final  int index;

/// Create a copy of AttributeManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveAttributeCopyWith<_RemoveAttribute> get copyWith => __$RemoveAttributeCopyWithImpl<_RemoveAttribute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveAttribute&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'AttributeManagementEvent.remove(index: $index)';
}


}

/// @nodoc
abstract mixin class _$RemoveAttributeCopyWith<$Res> implements $AttributeManagementEventCopyWith<$Res> {
  factory _$RemoveAttributeCopyWith(_RemoveAttribute value, $Res Function(_RemoveAttribute) _then) = __$RemoveAttributeCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$RemoveAttributeCopyWithImpl<$Res>
    implements _$RemoveAttributeCopyWith<$Res> {
  __$RemoveAttributeCopyWithImpl(this._self, this._then);

  final _RemoveAttribute _self;
  final $Res Function(_RemoveAttribute) _then;

/// Create a copy of AttributeManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_RemoveAttribute(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _OnSubmitted implements AttributeManagementEvent {
  const _OnSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttributeManagementEvent.onSubmitted()';
}


}




/// @nodoc
mixin _$AttributeManagementState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeManagementState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttributeManagementState()';
}


}

/// @nodoc
class $AttributeManagementStateCopyWith<$Res>  {
$AttributeManagementStateCopyWith(AttributeManagementState _, $Res Function(AttributeManagementState) __);
}


/// @nodoc


class AMLoading implements AttributeManagementState {
  const AMLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AMLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AttributeManagementState.loading()';
}


}




/// @nodoc


class AMError implements AttributeManagementState {
  const AMError(this.message);
  

 final  String message;

/// Create a copy of AttributeManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AMErrorCopyWith<AMError> get copyWith => _$AMErrorCopyWithImpl<AMError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AMError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AttributeManagementState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AMErrorCopyWith<$Res> implements $AttributeManagementStateCopyWith<$Res> {
  factory $AMErrorCopyWith(AMError value, $Res Function(AMError) _then) = _$AMErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AMErrorCopyWithImpl<$Res>
    implements $AMErrorCopyWith<$Res> {
  _$AMErrorCopyWithImpl(this._self, this._then);

  final AMError _self;
  final $Res Function(AMError) _then;

/// Create a copy of AttributeManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AMError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AMLoaded implements AttributeManagementState {
  const AMLoaded({required final  List<Attribute> fixedAttributes, required final  List<Attribute> customAttributes}): _fixedAttributes = fixedAttributes,_customAttributes = customAttributes;
  

 final  List<Attribute> _fixedAttributes;
 List<Attribute> get fixedAttributes {
  if (_fixedAttributes is EqualUnmodifiableListView) return _fixedAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fixedAttributes);
}

 final  List<Attribute> _customAttributes;
 List<Attribute> get customAttributes {
  if (_customAttributes is EqualUnmodifiableListView) return _customAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customAttributes);
}


/// Create a copy of AttributeManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AMLoadedCopyWith<AMLoaded> get copyWith => _$AMLoadedCopyWithImpl<AMLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AMLoaded&&const DeepCollectionEquality().equals(other._fixedAttributes, _fixedAttributes)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fixedAttributes),const DeepCollectionEquality().hash(_customAttributes));

@override
String toString() {
  return 'AttributeManagementState.loaded(fixedAttributes: $fixedAttributes, customAttributes: $customAttributes)';
}


}

/// @nodoc
abstract mixin class $AMLoadedCopyWith<$Res> implements $AttributeManagementStateCopyWith<$Res> {
  factory $AMLoadedCopyWith(AMLoaded value, $Res Function(AMLoaded) _then) = _$AMLoadedCopyWithImpl;
@useResult
$Res call({
 List<Attribute> fixedAttributes, List<Attribute> customAttributes
});




}
/// @nodoc
class _$AMLoadedCopyWithImpl<$Res>
    implements $AMLoadedCopyWith<$Res> {
  _$AMLoadedCopyWithImpl(this._self, this._then);

  final AMLoaded _self;
  final $Res Function(AMLoaded) _then;

/// Create a copy of AttributeManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fixedAttributes = null,Object? customAttributes = null,}) {
  return _then(AMLoaded(
fixedAttributes: null == fixedAttributes ? _self._fixedAttributes : fixedAttributes // ignore: cast_nullable_to_non_nullable
as List<Attribute>,customAttributes: null == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as List<Attribute>,
  ));
}


}

// dart format on
