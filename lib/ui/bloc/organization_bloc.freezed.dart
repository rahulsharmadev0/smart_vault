// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrganizationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrganizationEvent()';
}


}

/// @nodoc
class $OrganizationEventCopyWith<$Res>  {
$OrganizationEventCopyWith(OrganizationEvent _, $Res Function(OrganizationEvent) __);
}


/// @nodoc


class CreateOrganization implements OrganizationEvent {
  const CreateOrganization(this.email, this.name, this.organizationId);
  

 final  String email;
 final  String name;
 final  String organizationId;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrganizationCopyWith<CreateOrganization> get copyWith => _$CreateOrganizationCopyWithImpl<CreateOrganization>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrganization&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId));
}


@override
int get hashCode => Object.hash(runtimeType,email,name,organizationId);

@override
String toString() {
  return 'OrganizationEvent.create(email: $email, name: $name, organizationId: $organizationId)';
}


}

/// @nodoc
abstract mixin class $CreateOrganizationCopyWith<$Res> implements $OrganizationEventCopyWith<$Res> {
  factory $CreateOrganizationCopyWith(CreateOrganization value, $Res Function(CreateOrganization) _then) = _$CreateOrganizationCopyWithImpl;
@useResult
$Res call({
 String email, String name, String organizationId
});




}
/// @nodoc
class _$CreateOrganizationCopyWithImpl<$Res>
    implements $CreateOrganizationCopyWith<$Res> {
  _$CreateOrganizationCopyWithImpl(this._self, this._then);

  final CreateOrganization _self;
  final $Res Function(CreateOrganization) _then;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? name = null,Object? organizationId = null,}) {
  return _then(CreateOrganization(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadOrganization implements OrganizationEvent {
  const LoadOrganization(this.value);
  

 final  String value;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadOrganizationCopyWith<LoadOrganization> get copyWith => _$LoadOrganizationCopyWithImpl<LoadOrganization>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadOrganization&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'OrganizationEvent.load(value: $value)';
}


}

/// @nodoc
abstract mixin class $LoadOrganizationCopyWith<$Res> implements $OrganizationEventCopyWith<$Res> {
  factory $LoadOrganizationCopyWith(LoadOrganization value, $Res Function(LoadOrganization) _then) = _$LoadOrganizationCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$LoadOrganizationCopyWithImpl<$Res>
    implements $LoadOrganizationCopyWith<$Res> {
  _$LoadOrganizationCopyWithImpl(this._self, this._then);

  final LoadOrganization _self;
  final $Res Function(LoadOrganization) _then;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(LoadOrganization(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateName implements OrganizationEvent {
  const UpdateName(this.value);
  

 final  String value;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateNameCopyWith<UpdateName> get copyWith => _$UpdateNameCopyWithImpl<UpdateName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateName&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'OrganizationEvent.updateName(value: $value)';
}


}

/// @nodoc
abstract mixin class $UpdateNameCopyWith<$Res> implements $OrganizationEventCopyWith<$Res> {
  factory $UpdateNameCopyWith(UpdateName value, $Res Function(UpdateName) _then) = _$UpdateNameCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UpdateNameCopyWithImpl<$Res>
    implements $UpdateNameCopyWith<$Res> {
  _$UpdateNameCopyWithImpl(this._self, this._then);

  final UpdateName _self;
  final $Res Function(UpdateName) _then;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UpdateName(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateDescription implements OrganizationEvent {
  const UpdateDescription(this.value);
  

 final  String value;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDescriptionCopyWith<UpdateDescription> get copyWith => _$UpdateDescriptionCopyWithImpl<UpdateDescription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDescription&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'OrganizationEvent.updateDescription(value: $value)';
}


}

/// @nodoc
abstract mixin class $UpdateDescriptionCopyWith<$Res> implements $OrganizationEventCopyWith<$Res> {
  factory $UpdateDescriptionCopyWith(UpdateDescription value, $Res Function(UpdateDescription) _then) = _$UpdateDescriptionCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UpdateDescriptionCopyWithImpl<$Res>
    implements $UpdateDescriptionCopyWith<$Res> {
  _$UpdateDescriptionCopyWithImpl(this._self, this._then);

  final UpdateDescription _self;
  final $Res Function(UpdateDescription) _then;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UpdateDescription(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$OrganizationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrganizationState()';
}


}

/// @nodoc
class $OrganizationStateCopyWith<$Res>  {
$OrganizationStateCopyWith(OrganizationState _, $Res Function(OrganizationState) __);
}


/// @nodoc


class OrgInitialState implements OrganizationState {
  const OrgInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrganizationState.initial()';
}


}




/// @nodoc


class OrganizationLoadingState implements OrganizationState {
  const OrganizationLoadingState({this.msg});
  

 final  String? msg;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationLoadingStateCopyWith<OrganizationLoadingState> get copyWith => _$OrganizationLoadingStateCopyWithImpl<OrganizationLoadingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationLoadingState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'OrganizationState.loading(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $OrganizationLoadingStateCopyWith<$Res> implements $OrganizationStateCopyWith<$Res> {
  factory $OrganizationLoadingStateCopyWith(OrganizationLoadingState value, $Res Function(OrganizationLoadingState) _then) = _$OrganizationLoadingStateCopyWithImpl;
@useResult
$Res call({
 String? msg
});




}
/// @nodoc
class _$OrganizationLoadingStateCopyWithImpl<$Res>
    implements $OrganizationLoadingStateCopyWith<$Res> {
  _$OrganizationLoadingStateCopyWithImpl(this._self, this._then);

  final OrganizationLoadingState _self;
  final $Res Function(OrganizationLoadingState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = freezed,}) {
  return _then(OrganizationLoadingState(
msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OrganizationErrorState implements OrganizationState {
  const OrganizationErrorState({required this.msg});
  

 final  String msg;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationErrorStateCopyWith<OrganizationErrorState> get copyWith => _$OrganizationErrorStateCopyWithImpl<OrganizationErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationErrorState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'OrganizationState.error(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $OrganizationErrorStateCopyWith<$Res> implements $OrganizationStateCopyWith<$Res> {
  factory $OrganizationErrorStateCopyWith(OrganizationErrorState value, $Res Function(OrganizationErrorState) _then) = _$OrganizationErrorStateCopyWithImpl;
@useResult
$Res call({
 String msg
});




}
/// @nodoc
class _$OrganizationErrorStateCopyWithImpl<$Res>
    implements $OrganizationErrorStateCopyWith<$Res> {
  _$OrganizationErrorStateCopyWithImpl(this._self, this._then);

  final OrganizationErrorState _self;
  final $Res Function(OrganizationErrorState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = null,}) {
  return _then(OrganizationErrorState(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OrganizationLoadedState implements OrganizationState {
  const OrganizationLoadedState({required this.organization, this.msg});
  

 final  Organization organization;
 final  String? msg;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationLoadedStateCopyWith<OrganizationLoadedState> get copyWith => _$OrganizationLoadedStateCopyWithImpl<OrganizationLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationLoadedState&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,organization,msg);

@override
String toString() {
  return 'OrganizationState.loaded(organization: $organization, msg: $msg)';
}


}

/// @nodoc
abstract mixin class $OrganizationLoadedStateCopyWith<$Res> implements $OrganizationStateCopyWith<$Res> {
  factory $OrganizationLoadedStateCopyWith(OrganizationLoadedState value, $Res Function(OrganizationLoadedState) _then) = _$OrganizationLoadedStateCopyWithImpl;
@useResult
$Res call({
 Organization organization, String? msg
});


$OrganizationCopyWith<$Res> get organization;

}
/// @nodoc
class _$OrganizationLoadedStateCopyWithImpl<$Res>
    implements $OrganizationLoadedStateCopyWith<$Res> {
  _$OrganizationLoadedStateCopyWithImpl(this._self, this._then);

  final OrganizationLoadedState _self;
  final $Res Function(OrganizationLoadedState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? organization = null,Object? msg = freezed,}) {
  return _then(OrganizationLoadedState(
organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as Organization,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizationCopyWith<$Res> get organization {
  
  return $OrganizationCopyWith<$Res>(_self.organization, (value) {
    return _then(_self.copyWith(organization: value));
  });
}
}

// dart format on
