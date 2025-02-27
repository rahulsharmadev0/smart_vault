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

 String get value;
/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationEventCopyWith<OrganizationEvent> get copyWith => _$OrganizationEventCopyWithImpl<OrganizationEvent>(this as OrganizationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationEvent&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'OrganizationEvent(value: $value)';
}


}

/// @nodoc
abstract mixin class $OrganizationEventCopyWith<$Res>  {
  factory $OrganizationEventCopyWith(OrganizationEvent value, $Res Function(OrganizationEvent) _then) = _$OrganizationEventCopyWithImpl;
@useResult
$Res call({
 String value
});



}
/// @nodoc
class _$OrganizationEventCopyWithImpl<$Res>
    implements $OrganizationEventCopyWith<$Res> {
  _$OrganizationEventCopyWithImpl(this._self, this._then);

  final OrganizationEvent _self;
  final $Res Function(OrganizationEvent) _then;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class LoadOrganization implements OrganizationEvent {
  const LoadOrganization(this.value);
  

@override final  String value;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'OrganizationEvent.loadOrganization(value: $value)';
}


}

/// @nodoc
abstract mixin class $LoadOrganizationCopyWith<$Res> implements $OrganizationEventCopyWith<$Res> {
  factory $LoadOrganizationCopyWith(LoadOrganization value, $Res Function(LoadOrganization) _then) = _$LoadOrganizationCopyWithImpl;
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(LoadOrganization(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateName implements OrganizationEvent {
  const UpdateName(this.value);
  

@override final  String value;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UpdateName(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateDescription implements OrganizationEvent {
  const UpdateDescription(this.value);
  

@override final  String value;

/// Create a copy of OrganizationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
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


class OrgLoadingState implements OrganizationState {
  const OrgLoadingState({this.msg});
  

 final  String? msg;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgLoadingStateCopyWith<OrgLoadingState> get copyWith => _$OrgLoadingStateCopyWithImpl<OrgLoadingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgLoadingState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'OrganizationState.loading(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $OrgLoadingStateCopyWith<$Res>  {
  factory $OrgLoadingStateCopyWith(OrgLoadingState value, $Res Function(OrgLoadingState) _then) = _$OrgLoadingStateCopyWithImpl;
@useResult
$Res call({
 String? msg
});



}
/// @nodoc
class _$OrgLoadingStateCopyWithImpl<$Res>
    implements $OrgLoadingStateCopyWith<$Res> {
  _$OrgLoadingStateCopyWithImpl(this._self, this._then);

  final OrgLoadingState _self;
  final $Res Function(OrgLoadingState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = freezed,}) {
  return _then(OrgLoadingState(
msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OrgErrorState implements OrganizationState {
  const OrgErrorState({required this.msg});
  

 final  String msg;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgErrorStateCopyWith<OrgErrorState> get copyWith => _$OrgErrorStateCopyWithImpl<OrgErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgErrorState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'OrganizationState.error(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $OrgErrorStateCopyWith<$Res>  {
  factory $OrgErrorStateCopyWith(OrgErrorState value, $Res Function(OrgErrorState) _then) = _$OrgErrorStateCopyWithImpl;
@useResult
$Res call({
 String msg
});



}
/// @nodoc
class _$OrgErrorStateCopyWithImpl<$Res>
    implements $OrgErrorStateCopyWith<$Res> {
  _$OrgErrorStateCopyWithImpl(this._self, this._then);

  final OrgErrorState _self;
  final $Res Function(OrgErrorState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = null,}) {
  return _then(OrgErrorState(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OrgLoadedState implements OrganizationState {
  const OrgLoadedState({required this.organization, this.msg});
  

 final  Organization organization;
 final  String? msg;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgLoadedStateCopyWith<OrgLoadedState> get copyWith => _$OrgLoadedStateCopyWithImpl<OrgLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgLoadedState&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,organization,msg);

@override
String toString() {
  return 'OrganizationState.loaded(organization: $organization, msg: $msg)';
}


}

/// @nodoc
abstract mixin class $OrgLoadedStateCopyWith<$Res>  {
  factory $OrgLoadedStateCopyWith(OrgLoadedState value, $Res Function(OrgLoadedState) _then) = _$OrgLoadedStateCopyWithImpl;
@useResult
$Res call({
 Organization organization, String? msg
});



}
/// @nodoc
class _$OrgLoadedStateCopyWithImpl<$Res>
    implements $OrgLoadedStateCopyWith<$Res> {
  _$OrgLoadedStateCopyWithImpl(this._self, this._then);

  final OrgLoadedState _self;
  final $Res Function(OrgLoadedState) _then;

/// Create a copy of OrganizationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? organization = null,Object? msg = freezed,}) {
  return _then(OrgLoadedState(
organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as Organization,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
