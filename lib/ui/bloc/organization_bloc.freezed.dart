// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrganizationEvent {
  String get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) loadOrganization,
    required TResult Function(String value) updateName,
    required TResult Function(String value) updateDescription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? loadOrganization,
    TResult? Function(String value)? updateName,
    TResult? Function(String value)? updateDescription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? loadOrganization,
    TResult Function(String value)? updateName,
    TResult Function(String value)? updateDescription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadOrganization value) loadOrganization,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateDescription value) updateDescription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadOrganization value)? loadOrganization,
    TResult? Function(UpdateName value)? updateName,
    TResult? Function(UpdateDescription value)? updateDescription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadOrganization value)? loadOrganization,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateDescription value)? updateDescription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizationEventCopyWith<OrganizationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationEventCopyWith<$Res> {
  factory $OrganizationEventCopyWith(
          OrganizationEvent value, $Res Function(OrganizationEvent) then) =
      _$OrganizationEventCopyWithImpl<$Res, OrganizationEvent>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$OrganizationEventCopyWithImpl<$Res, $Val extends OrganizationEvent>
    implements $OrganizationEventCopyWith<$Res> {
  _$OrganizationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadOrganizationImplCopyWith<$Res>
    implements $OrganizationEventCopyWith<$Res> {
  factory _$$LoadOrganizationImplCopyWith(_$LoadOrganizationImpl value,
          $Res Function(_$LoadOrganizationImpl) then) =
      __$$LoadOrganizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$LoadOrganizationImplCopyWithImpl<$Res>
    extends _$OrganizationEventCopyWithImpl<$Res, _$LoadOrganizationImpl>
    implements _$$LoadOrganizationImplCopyWith<$Res> {
  __$$LoadOrganizationImplCopyWithImpl(_$LoadOrganizationImpl _value,
      $Res Function(_$LoadOrganizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$LoadOrganizationImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadOrganizationImpl implements LoadOrganization {
  const _$LoadOrganizationImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'OrganizationEvent.loadOrganization(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOrganizationImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOrganizationImplCopyWith<_$LoadOrganizationImpl> get copyWith =>
      __$$LoadOrganizationImplCopyWithImpl<_$LoadOrganizationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) loadOrganization,
    required TResult Function(String value) updateName,
    required TResult Function(String value) updateDescription,
  }) {
    return loadOrganization(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? loadOrganization,
    TResult? Function(String value)? updateName,
    TResult? Function(String value)? updateDescription,
  }) {
    return loadOrganization?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? loadOrganization,
    TResult Function(String value)? updateName,
    TResult Function(String value)? updateDescription,
    required TResult orElse(),
  }) {
    if (loadOrganization != null) {
      return loadOrganization(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadOrganization value) loadOrganization,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateDescription value) updateDescription,
  }) {
    return loadOrganization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadOrganization value)? loadOrganization,
    TResult? Function(UpdateName value)? updateName,
    TResult? Function(UpdateDescription value)? updateDescription,
  }) {
    return loadOrganization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadOrganization value)? loadOrganization,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateDescription value)? updateDescription,
    required TResult orElse(),
  }) {
    if (loadOrganization != null) {
      return loadOrganization(this);
    }
    return orElse();
  }
}

abstract class LoadOrganization implements OrganizationEvent {
  const factory LoadOrganization(final String value) = _$LoadOrganizationImpl;

  @override
  String get value;

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadOrganizationImplCopyWith<_$LoadOrganizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNameImplCopyWith<$Res>
    implements $OrganizationEventCopyWith<$Res> {
  factory _$$UpdateNameImplCopyWith(
          _$UpdateNameImpl value, $Res Function(_$UpdateNameImpl) then) =
      __$$UpdateNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UpdateNameImplCopyWithImpl<$Res>
    extends _$OrganizationEventCopyWithImpl<$Res, _$UpdateNameImpl>
    implements _$$UpdateNameImplCopyWith<$Res> {
  __$$UpdateNameImplCopyWithImpl(
      _$UpdateNameImpl _value, $Res Function(_$UpdateNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdateNameImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateNameImpl implements UpdateName {
  const _$UpdateNameImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'OrganizationEvent.updateName(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNameImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNameImplCopyWith<_$UpdateNameImpl> get copyWith =>
      __$$UpdateNameImplCopyWithImpl<_$UpdateNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) loadOrganization,
    required TResult Function(String value) updateName,
    required TResult Function(String value) updateDescription,
  }) {
    return updateName(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? loadOrganization,
    TResult? Function(String value)? updateName,
    TResult? Function(String value)? updateDescription,
  }) {
    return updateName?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? loadOrganization,
    TResult Function(String value)? updateName,
    TResult Function(String value)? updateDescription,
    required TResult orElse(),
  }) {
    if (updateName != null) {
      return updateName(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadOrganization value) loadOrganization,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateDescription value) updateDescription,
  }) {
    return updateName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadOrganization value)? loadOrganization,
    TResult? Function(UpdateName value)? updateName,
    TResult? Function(UpdateDescription value)? updateDescription,
  }) {
    return updateName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadOrganization value)? loadOrganization,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateDescription value)? updateDescription,
    required TResult orElse(),
  }) {
    if (updateName != null) {
      return updateName(this);
    }
    return orElse();
  }
}

abstract class UpdateName implements OrganizationEvent {
  const factory UpdateName(final String value) = _$UpdateNameImpl;

  @override
  String get value;

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNameImplCopyWith<_$UpdateNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDescriptionImplCopyWith<$Res>
    implements $OrganizationEventCopyWith<$Res> {
  factory _$$UpdateDescriptionImplCopyWith(_$UpdateDescriptionImpl value,
          $Res Function(_$UpdateDescriptionImpl) then) =
      __$$UpdateDescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UpdateDescriptionImplCopyWithImpl<$Res>
    extends _$OrganizationEventCopyWithImpl<$Res, _$UpdateDescriptionImpl>
    implements _$$UpdateDescriptionImplCopyWith<$Res> {
  __$$UpdateDescriptionImplCopyWithImpl(_$UpdateDescriptionImpl _value,
      $Res Function(_$UpdateDescriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdateDescriptionImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateDescriptionImpl implements UpdateDescription {
  const _$UpdateDescriptionImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'OrganizationEvent.updateDescription(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDescriptionImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDescriptionImplCopyWith<_$UpdateDescriptionImpl> get copyWith =>
      __$$UpdateDescriptionImplCopyWithImpl<_$UpdateDescriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) loadOrganization,
    required TResult Function(String value) updateName,
    required TResult Function(String value) updateDescription,
  }) {
    return updateDescription(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? loadOrganization,
    TResult? Function(String value)? updateName,
    TResult? Function(String value)? updateDescription,
  }) {
    return updateDescription?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? loadOrganization,
    TResult Function(String value)? updateName,
    TResult Function(String value)? updateDescription,
    required TResult orElse(),
  }) {
    if (updateDescription != null) {
      return updateDescription(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadOrganization value) loadOrganization,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateDescription value) updateDescription,
  }) {
    return updateDescription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadOrganization value)? loadOrganization,
    TResult? Function(UpdateName value)? updateName,
    TResult? Function(UpdateDescription value)? updateDescription,
  }) {
    return updateDescription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadOrganization value)? loadOrganization,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateDescription value)? updateDescription,
    required TResult orElse(),
  }) {
    if (updateDescription != null) {
      return updateDescription(this);
    }
    return orElse();
  }
}

abstract class UpdateDescription implements OrganizationEvent {
  const factory UpdateDescription(final String value) = _$UpdateDescriptionImpl;

  @override
  String get value;

  /// Create a copy of OrganizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDescriptionImplCopyWith<_$UpdateDescriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrganizationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(Organization organization, String? msg) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(Organization organization, String? msg)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(Organization organization, String? msg)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrgInitialState value) initial,
    required TResult Function(OrgLoadingState value) loading,
    required TResult Function(OrgErrorState value) error,
    required TResult Function(OrgLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrgInitialState value)? initial,
    TResult? Function(OrgLoadingState value)? loading,
    TResult? Function(OrgErrorState value)? error,
    TResult? Function(OrgLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrgInitialState value)? initial,
    TResult Function(OrgLoadingState value)? loading,
    TResult Function(OrgErrorState value)? error,
    TResult Function(OrgLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationStateCopyWith<$Res> {
  factory $OrganizationStateCopyWith(
          OrganizationState value, $Res Function(OrganizationState) then) =
      _$OrganizationStateCopyWithImpl<$Res, OrganizationState>;
}

/// @nodoc
class _$OrganizationStateCopyWithImpl<$Res, $Val extends OrganizationState>
    implements $OrganizationStateCopyWith<$Res> {
  _$OrganizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OrgInitialStateImplCopyWith<$Res> {
  factory _$$OrgInitialStateImplCopyWith(_$OrgInitialStateImpl value,
          $Res Function(_$OrgInitialStateImpl) then) =
      __$$OrgInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrgInitialStateImplCopyWithImpl<$Res>
    extends _$OrganizationStateCopyWithImpl<$Res, _$OrgInitialStateImpl>
    implements _$$OrgInitialStateImplCopyWith<$Res> {
  __$$OrgInitialStateImplCopyWithImpl(
      _$OrgInitialStateImpl _value, $Res Function(_$OrgInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrgInitialStateImpl implements OrgInitialState {
  const _$OrgInitialStateImpl();

  @override
  String toString() {
    return 'OrganizationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrgInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(Organization organization, String? msg) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(Organization organization, String? msg)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(Organization organization, String? msg)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrgInitialState value) initial,
    required TResult Function(OrgLoadingState value) loading,
    required TResult Function(OrgErrorState value) error,
    required TResult Function(OrgLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrgInitialState value)? initial,
    TResult? Function(OrgLoadingState value)? loading,
    TResult? Function(OrgErrorState value)? error,
    TResult? Function(OrgLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrgInitialState value)? initial,
    TResult Function(OrgLoadingState value)? loading,
    TResult Function(OrgErrorState value)? error,
    TResult Function(OrgLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OrgInitialState implements OrganizationState {
  const factory OrgInitialState() = _$OrgInitialStateImpl;
}

/// @nodoc
abstract class _$$OrgLoadingStateImplCopyWith<$Res> {
  factory _$$OrgLoadingStateImplCopyWith(_$OrgLoadingStateImpl value,
          $Res Function(_$OrgLoadingStateImpl) then) =
      __$$OrgLoadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? msg});
}

/// @nodoc
class __$$OrgLoadingStateImplCopyWithImpl<$Res>
    extends _$OrganizationStateCopyWithImpl<$Res, _$OrgLoadingStateImpl>
    implements _$$OrgLoadingStateImplCopyWith<$Res> {
  __$$OrgLoadingStateImplCopyWithImpl(
      _$OrgLoadingStateImpl _value, $Res Function(_$OrgLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$OrgLoadingStateImpl(
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OrgLoadingStateImpl implements OrgLoadingState {
  const _$OrgLoadingStateImpl({this.msg});

  @override
  final String? msg;

  @override
  String toString() {
    return 'OrganizationState.loading(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrgLoadingStateImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrgLoadingStateImplCopyWith<_$OrgLoadingStateImpl> get copyWith =>
      __$$OrgLoadingStateImplCopyWithImpl<_$OrgLoadingStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(Organization organization, String? msg) loaded,
  }) {
    return loading(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(Organization organization, String? msg)? loaded,
  }) {
    return loading?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(Organization organization, String? msg)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrgInitialState value) initial,
    required TResult Function(OrgLoadingState value) loading,
    required TResult Function(OrgErrorState value) error,
    required TResult Function(OrgLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrgInitialState value)? initial,
    TResult? Function(OrgLoadingState value)? loading,
    TResult? Function(OrgErrorState value)? error,
    TResult? Function(OrgLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrgInitialState value)? initial,
    TResult Function(OrgLoadingState value)? loading,
    TResult Function(OrgErrorState value)? error,
    TResult Function(OrgLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrgLoadingState implements OrganizationState {
  const factory OrgLoadingState({final String? msg}) = _$OrgLoadingStateImpl;

  String? get msg;

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrgLoadingStateImplCopyWith<_$OrgLoadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrgErrorStateImplCopyWith<$Res> {
  factory _$$OrgErrorStateImplCopyWith(
          _$OrgErrorStateImpl value, $Res Function(_$OrgErrorStateImpl) then) =
      __$$OrgErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$OrgErrorStateImplCopyWithImpl<$Res>
    extends _$OrganizationStateCopyWithImpl<$Res, _$OrgErrorStateImpl>
    implements _$$OrgErrorStateImplCopyWith<$Res> {
  __$$OrgErrorStateImplCopyWithImpl(
      _$OrgErrorStateImpl _value, $Res Function(_$OrgErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$OrgErrorStateImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrgErrorStateImpl implements OrgErrorState {
  const _$OrgErrorStateImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'OrganizationState.error(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrgErrorStateImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrgErrorStateImplCopyWith<_$OrgErrorStateImpl> get copyWith =>
      __$$OrgErrorStateImplCopyWithImpl<_$OrgErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(Organization organization, String? msg) loaded,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(Organization organization, String? msg)? loaded,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(Organization organization, String? msg)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrgInitialState value) initial,
    required TResult Function(OrgLoadingState value) loading,
    required TResult Function(OrgErrorState value) error,
    required TResult Function(OrgLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrgInitialState value)? initial,
    TResult? Function(OrgLoadingState value)? loading,
    TResult? Function(OrgErrorState value)? error,
    TResult? Function(OrgLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrgInitialState value)? initial,
    TResult Function(OrgLoadingState value)? loading,
    TResult Function(OrgErrorState value)? error,
    TResult Function(OrgLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrgErrorState implements OrganizationState {
  const factory OrgErrorState({required final String msg}) =
      _$OrgErrorStateImpl;

  String get msg;

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrgErrorStateImplCopyWith<_$OrgErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrgLoadedStateImplCopyWith<$Res> {
  factory _$$OrgLoadedStateImplCopyWith(_$OrgLoadedStateImpl value,
          $Res Function(_$OrgLoadedStateImpl) then) =
      __$$OrgLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Organization organization, String? msg});

  $OrganizationCopyWith<$Res> get organization;
}

/// @nodoc
class __$$OrgLoadedStateImplCopyWithImpl<$Res>
    extends _$OrganizationStateCopyWithImpl<$Res, _$OrgLoadedStateImpl>
    implements _$$OrgLoadedStateImplCopyWith<$Res> {
  __$$OrgLoadedStateImplCopyWithImpl(
      _$OrgLoadedStateImpl _value, $Res Function(_$OrgLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = null,
    Object? msg = freezed,
  }) {
    return _then(_$OrgLoadedStateImpl(
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationCopyWith<$Res> get organization {
    return $OrganizationCopyWith<$Res>(_value.organization, (value) {
      return _then(_value.copyWith(organization: value));
    });
  }
}

/// @nodoc

class _$OrgLoadedStateImpl implements OrgLoadedState {
  const _$OrgLoadedStateImpl({required this.organization, this.msg});

  @override
  final Organization organization;
  @override
  final String? msg;

  @override
  String toString() {
    return 'OrganizationState.loaded(organization: $organization, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrgLoadedStateImpl &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organization, msg);

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrgLoadedStateImplCopyWith<_$OrgLoadedStateImpl> get copyWith =>
      __$$OrgLoadedStateImplCopyWithImpl<_$OrgLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(Organization organization, String? msg) loaded,
  }) {
    return loaded(organization, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(Organization organization, String? msg)? loaded,
  }) {
    return loaded?.call(organization, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(Organization organization, String? msg)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(organization, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrgInitialState value) initial,
    required TResult Function(OrgLoadingState value) loading,
    required TResult Function(OrgErrorState value) error,
    required TResult Function(OrgLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrgInitialState value)? initial,
    TResult? Function(OrgLoadingState value)? loading,
    TResult? Function(OrgErrorState value)? error,
    TResult? Function(OrgLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrgInitialState value)? initial,
    TResult Function(OrgLoadingState value)? loading,
    TResult Function(OrgErrorState value)? error,
    TResult Function(OrgLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class OrgLoadedState implements OrganizationState {
  const factory OrgLoadedState(
      {required final Organization organization,
      final String? msg}) = _$OrgLoadedStateImpl;

  Organization get organization;
  String? get msg;

  /// Create a copy of OrganizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrgLoadedStateImplCopyWith<_$OrgLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
