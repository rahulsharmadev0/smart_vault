// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bucket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BucketEvent {
  String get orgId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orgId, Bucket bucket) create,
    required TResult Function(String orgId, Bucket bucket) update,
    required TResult Function(String orgId, String bucketId) delete,
    required TResult Function(String orgId) loadOrgBuckets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orgId, Bucket bucket)? create,
    TResult? Function(String orgId, Bucket bucket)? update,
    TResult? Function(String orgId, String bucketId)? delete,
    TResult? Function(String orgId)? loadOrgBuckets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orgId, Bucket bucket)? create,
    TResult Function(String orgId, Bucket bucket)? update,
    TResult Function(String orgId, String bucketId)? delete,
    TResult Function(String orgId)? loadOrgBuckets,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateBucket value) create,
    required TResult Function(UpdateBucket value) update,
    required TResult Function(DeleteBucket value) delete,
    required TResult Function(LoadOrgBuckets value) loadOrgBuckets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateBucket value)? create,
    TResult? Function(UpdateBucket value)? update,
    TResult? Function(DeleteBucket value)? delete,
    TResult? Function(LoadOrgBuckets value)? loadOrgBuckets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateBucket value)? create,
    TResult Function(UpdateBucket value)? update,
    TResult Function(DeleteBucket value)? delete,
    TResult Function(LoadOrgBuckets value)? loadOrgBuckets,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BucketEventCopyWith<BucketEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BucketEventCopyWith<$Res> {
  factory $BucketEventCopyWith(
          BucketEvent value, $Res Function(BucketEvent) then) =
      _$BucketEventCopyWithImpl<$Res, BucketEvent>;
  @useResult
  $Res call({String orgId});
}

/// @nodoc
class _$BucketEventCopyWithImpl<$Res, $Val extends BucketEvent>
    implements $BucketEventCopyWith<$Res> {
  _$BucketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = null,
  }) {
    return _then(_value.copyWith(
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBucketImplCopyWith<$Res>
    implements $BucketEventCopyWith<$Res> {
  factory _$$CreateBucketImplCopyWith(
          _$CreateBucketImpl value, $Res Function(_$CreateBucketImpl) then) =
      __$$CreateBucketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orgId, Bucket bucket});

  $BucketCopyWith<$Res> get bucket;
}

/// @nodoc
class __$$CreateBucketImplCopyWithImpl<$Res>
    extends _$BucketEventCopyWithImpl<$Res, _$CreateBucketImpl>
    implements _$$CreateBucketImplCopyWith<$Res> {
  __$$CreateBucketImplCopyWithImpl(
      _$CreateBucketImpl _value, $Res Function(_$CreateBucketImpl) _then)
      : super(_value, _then);

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = null,
    Object? bucket = null,
  }) {
    return _then(_$CreateBucketImpl(
      null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      null == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as Bucket,
    ));
  }

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BucketCopyWith<$Res> get bucket {
    return $BucketCopyWith<$Res>(_value.bucket, (value) {
      return _then(_value.copyWith(bucket: value));
    });
  }
}

/// @nodoc

class _$CreateBucketImpl implements CreateBucket {
  const _$CreateBucketImpl(this.orgId, this.bucket);

  @override
  final String orgId;
  @override
  final Bucket bucket;

  @override
  String toString() {
    return 'BucketEvent.create(orgId: $orgId, bucket: $bucket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBucketImpl &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.bucket, bucket) || other.bucket == bucket));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orgId, bucket);

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBucketImplCopyWith<_$CreateBucketImpl> get copyWith =>
      __$$CreateBucketImplCopyWithImpl<_$CreateBucketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orgId, Bucket bucket) create,
    required TResult Function(String orgId, Bucket bucket) update,
    required TResult Function(String orgId, String bucketId) delete,
    required TResult Function(String orgId) loadOrgBuckets,
  }) {
    return create(orgId, bucket);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orgId, Bucket bucket)? create,
    TResult? Function(String orgId, Bucket bucket)? update,
    TResult? Function(String orgId, String bucketId)? delete,
    TResult? Function(String orgId)? loadOrgBuckets,
  }) {
    return create?.call(orgId, bucket);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orgId, Bucket bucket)? create,
    TResult Function(String orgId, Bucket bucket)? update,
    TResult Function(String orgId, String bucketId)? delete,
    TResult Function(String orgId)? loadOrgBuckets,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(orgId, bucket);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateBucket value) create,
    required TResult Function(UpdateBucket value) update,
    required TResult Function(DeleteBucket value) delete,
    required TResult Function(LoadOrgBuckets value) loadOrgBuckets,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateBucket value)? create,
    TResult? Function(UpdateBucket value)? update,
    TResult? Function(DeleteBucket value)? delete,
    TResult? Function(LoadOrgBuckets value)? loadOrgBuckets,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateBucket value)? create,
    TResult Function(UpdateBucket value)? update,
    TResult Function(DeleteBucket value)? delete,
    TResult Function(LoadOrgBuckets value)? loadOrgBuckets,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateBucket implements BucketEvent {
  const factory CreateBucket(final String orgId, final Bucket bucket) =
      _$CreateBucketImpl;

  @override
  String get orgId;
  Bucket get bucket;

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBucketImplCopyWith<_$CreateBucketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBucketImplCopyWith<$Res>
    implements $BucketEventCopyWith<$Res> {
  factory _$$UpdateBucketImplCopyWith(
          _$UpdateBucketImpl value, $Res Function(_$UpdateBucketImpl) then) =
      __$$UpdateBucketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orgId, Bucket bucket});

  $BucketCopyWith<$Res> get bucket;
}

/// @nodoc
class __$$UpdateBucketImplCopyWithImpl<$Res>
    extends _$BucketEventCopyWithImpl<$Res, _$UpdateBucketImpl>
    implements _$$UpdateBucketImplCopyWith<$Res> {
  __$$UpdateBucketImplCopyWithImpl(
      _$UpdateBucketImpl _value, $Res Function(_$UpdateBucketImpl) _then)
      : super(_value, _then);

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = null,
    Object? bucket = null,
  }) {
    return _then(_$UpdateBucketImpl(
      null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      null == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as Bucket,
    ));
  }

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BucketCopyWith<$Res> get bucket {
    return $BucketCopyWith<$Res>(_value.bucket, (value) {
      return _then(_value.copyWith(bucket: value));
    });
  }
}

/// @nodoc

class _$UpdateBucketImpl implements UpdateBucket {
  const _$UpdateBucketImpl(this.orgId, this.bucket);

  @override
  final String orgId;
  @override
  final Bucket bucket;

  @override
  String toString() {
    return 'BucketEvent.update(orgId: $orgId, bucket: $bucket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBucketImpl &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.bucket, bucket) || other.bucket == bucket));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orgId, bucket);

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBucketImplCopyWith<_$UpdateBucketImpl> get copyWith =>
      __$$UpdateBucketImplCopyWithImpl<_$UpdateBucketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orgId, Bucket bucket) create,
    required TResult Function(String orgId, Bucket bucket) update,
    required TResult Function(String orgId, String bucketId) delete,
    required TResult Function(String orgId) loadOrgBuckets,
  }) {
    return update(orgId, bucket);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orgId, Bucket bucket)? create,
    TResult? Function(String orgId, Bucket bucket)? update,
    TResult? Function(String orgId, String bucketId)? delete,
    TResult? Function(String orgId)? loadOrgBuckets,
  }) {
    return update?.call(orgId, bucket);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orgId, Bucket bucket)? create,
    TResult Function(String orgId, Bucket bucket)? update,
    TResult Function(String orgId, String bucketId)? delete,
    TResult Function(String orgId)? loadOrgBuckets,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(orgId, bucket);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateBucket value) create,
    required TResult Function(UpdateBucket value) update,
    required TResult Function(DeleteBucket value) delete,
    required TResult Function(LoadOrgBuckets value) loadOrgBuckets,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateBucket value)? create,
    TResult? Function(UpdateBucket value)? update,
    TResult? Function(DeleteBucket value)? delete,
    TResult? Function(LoadOrgBuckets value)? loadOrgBuckets,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateBucket value)? create,
    TResult Function(UpdateBucket value)? update,
    TResult Function(DeleteBucket value)? delete,
    TResult Function(LoadOrgBuckets value)? loadOrgBuckets,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateBucket implements BucketEvent {
  const factory UpdateBucket(final String orgId, final Bucket bucket) =
      _$UpdateBucketImpl;

  @override
  String get orgId;
  Bucket get bucket;

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBucketImplCopyWith<_$UpdateBucketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBucketImplCopyWith<$Res>
    implements $BucketEventCopyWith<$Res> {
  factory _$$DeleteBucketImplCopyWith(
          _$DeleteBucketImpl value, $Res Function(_$DeleteBucketImpl) then) =
      __$$DeleteBucketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orgId, String bucketId});
}

/// @nodoc
class __$$DeleteBucketImplCopyWithImpl<$Res>
    extends _$BucketEventCopyWithImpl<$Res, _$DeleteBucketImpl>
    implements _$$DeleteBucketImplCopyWith<$Res> {
  __$$DeleteBucketImplCopyWithImpl(
      _$DeleteBucketImpl _value, $Res Function(_$DeleteBucketImpl) _then)
      : super(_value, _then);

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = null,
    Object? bucketId = null,
  }) {
    return _then(_$DeleteBucketImpl(
      null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      null == bucketId
          ? _value.bucketId
          : bucketId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteBucketImpl implements DeleteBucket {
  const _$DeleteBucketImpl(this.orgId, this.bucketId);

  @override
  final String orgId;
  @override
  final String bucketId;

  @override
  String toString() {
    return 'BucketEvent.delete(orgId: $orgId, bucketId: $bucketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBucketImpl &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.bucketId, bucketId) ||
                other.bucketId == bucketId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orgId, bucketId);

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBucketImplCopyWith<_$DeleteBucketImpl> get copyWith =>
      __$$DeleteBucketImplCopyWithImpl<_$DeleteBucketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orgId, Bucket bucket) create,
    required TResult Function(String orgId, Bucket bucket) update,
    required TResult Function(String orgId, String bucketId) delete,
    required TResult Function(String orgId) loadOrgBuckets,
  }) {
    return delete(orgId, bucketId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orgId, Bucket bucket)? create,
    TResult? Function(String orgId, Bucket bucket)? update,
    TResult? Function(String orgId, String bucketId)? delete,
    TResult? Function(String orgId)? loadOrgBuckets,
  }) {
    return delete?.call(orgId, bucketId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orgId, Bucket bucket)? create,
    TResult Function(String orgId, Bucket bucket)? update,
    TResult Function(String orgId, String bucketId)? delete,
    TResult Function(String orgId)? loadOrgBuckets,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(orgId, bucketId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateBucket value) create,
    required TResult Function(UpdateBucket value) update,
    required TResult Function(DeleteBucket value) delete,
    required TResult Function(LoadOrgBuckets value) loadOrgBuckets,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateBucket value)? create,
    TResult? Function(UpdateBucket value)? update,
    TResult? Function(DeleteBucket value)? delete,
    TResult? Function(LoadOrgBuckets value)? loadOrgBuckets,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateBucket value)? create,
    TResult Function(UpdateBucket value)? update,
    TResult Function(DeleteBucket value)? delete,
    TResult Function(LoadOrgBuckets value)? loadOrgBuckets,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteBucket implements BucketEvent {
  const factory DeleteBucket(final String orgId, final String bucketId) =
      _$DeleteBucketImpl;

  @override
  String get orgId;
  String get bucketId;

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteBucketImplCopyWith<_$DeleteBucketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadOrgBucketsImplCopyWith<$Res>
    implements $BucketEventCopyWith<$Res> {
  factory _$$LoadOrgBucketsImplCopyWith(_$LoadOrgBucketsImpl value,
          $Res Function(_$LoadOrgBucketsImpl) then) =
      __$$LoadOrgBucketsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orgId});
}

/// @nodoc
class __$$LoadOrgBucketsImplCopyWithImpl<$Res>
    extends _$BucketEventCopyWithImpl<$Res, _$LoadOrgBucketsImpl>
    implements _$$LoadOrgBucketsImplCopyWith<$Res> {
  __$$LoadOrgBucketsImplCopyWithImpl(
      _$LoadOrgBucketsImpl _value, $Res Function(_$LoadOrgBucketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = null,
  }) {
    return _then(_$LoadOrgBucketsImpl(
      null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadOrgBucketsImpl implements LoadOrgBuckets {
  const _$LoadOrgBucketsImpl(this.orgId);

  @override
  final String orgId;

  @override
  String toString() {
    return 'BucketEvent.loadOrgBuckets(orgId: $orgId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOrgBucketsImpl &&
            (identical(other.orgId, orgId) || other.orgId == orgId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orgId);

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOrgBucketsImplCopyWith<_$LoadOrgBucketsImpl> get copyWith =>
      __$$LoadOrgBucketsImplCopyWithImpl<_$LoadOrgBucketsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orgId, Bucket bucket) create,
    required TResult Function(String orgId, Bucket bucket) update,
    required TResult Function(String orgId, String bucketId) delete,
    required TResult Function(String orgId) loadOrgBuckets,
  }) {
    return loadOrgBuckets(orgId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orgId, Bucket bucket)? create,
    TResult? Function(String orgId, Bucket bucket)? update,
    TResult? Function(String orgId, String bucketId)? delete,
    TResult? Function(String orgId)? loadOrgBuckets,
  }) {
    return loadOrgBuckets?.call(orgId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orgId, Bucket bucket)? create,
    TResult Function(String orgId, Bucket bucket)? update,
    TResult Function(String orgId, String bucketId)? delete,
    TResult Function(String orgId)? loadOrgBuckets,
    required TResult orElse(),
  }) {
    if (loadOrgBuckets != null) {
      return loadOrgBuckets(orgId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateBucket value) create,
    required TResult Function(UpdateBucket value) update,
    required TResult Function(DeleteBucket value) delete,
    required TResult Function(LoadOrgBuckets value) loadOrgBuckets,
  }) {
    return loadOrgBuckets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateBucket value)? create,
    TResult? Function(UpdateBucket value)? update,
    TResult? Function(DeleteBucket value)? delete,
    TResult? Function(LoadOrgBuckets value)? loadOrgBuckets,
  }) {
    return loadOrgBuckets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateBucket value)? create,
    TResult Function(UpdateBucket value)? update,
    TResult Function(DeleteBucket value)? delete,
    TResult Function(LoadOrgBuckets value)? loadOrgBuckets,
    required TResult orElse(),
  }) {
    if (loadOrgBuckets != null) {
      return loadOrgBuckets(this);
    }
    return orElse();
  }
}

abstract class LoadOrgBuckets implements BucketEvent {
  const factory LoadOrgBuckets(final String orgId) = _$LoadOrgBucketsImpl;

  @override
  String get orgId;

  /// Create a copy of BucketEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadOrgBucketsImplCopyWith<_$LoadOrgBucketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BucketState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<Bucket> bucket, int? workOnIndex, String? msg)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBucketState value) initial,
    required TResult Function(LoadingBucketState value) loading,
    required TResult Function(ErrorBucketState value) error,
    required TResult Function(LoadedBucketState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBucketState value)? initial,
    TResult? Function(LoadingBucketState value)? loading,
    TResult? Function(ErrorBucketState value)? error,
    TResult? Function(LoadedBucketState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBucketState value)? initial,
    TResult Function(LoadingBucketState value)? loading,
    TResult Function(ErrorBucketState value)? error,
    TResult Function(LoadedBucketState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BucketStateCopyWith<$Res> {
  factory $BucketStateCopyWith(
          BucketState value, $Res Function(BucketState) then) =
      _$BucketStateCopyWithImpl<$Res, BucketState>;
}

/// @nodoc
class _$BucketStateCopyWithImpl<$Res, $Val extends BucketState>
    implements $BucketStateCopyWith<$Res> {
  _$BucketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialBucketStateImplCopyWith<$Res> {
  factory _$$InitialBucketStateImplCopyWith(_$InitialBucketStateImpl value,
          $Res Function(_$InitialBucketStateImpl) then) =
      __$$InitialBucketStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialBucketStateImplCopyWithImpl<$Res>
    extends _$BucketStateCopyWithImpl<$Res, _$InitialBucketStateImpl>
    implements _$$InitialBucketStateImplCopyWith<$Res> {
  __$$InitialBucketStateImplCopyWithImpl(_$InitialBucketStateImpl _value,
      $Res Function(_$InitialBucketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialBucketStateImpl implements InitialBucketState {
  const _$InitialBucketStateImpl();

  @override
  String toString() {
    return 'BucketState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialBucketStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<Bucket> bucket, int? workOnIndex, String? msg)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
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
    required TResult Function(InitialBucketState value) initial,
    required TResult Function(LoadingBucketState value) loading,
    required TResult Function(ErrorBucketState value) error,
    required TResult Function(LoadedBucketState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBucketState value)? initial,
    TResult? Function(LoadingBucketState value)? loading,
    TResult? Function(ErrorBucketState value)? error,
    TResult? Function(LoadedBucketState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBucketState value)? initial,
    TResult Function(LoadingBucketState value)? loading,
    TResult Function(ErrorBucketState value)? error,
    TResult Function(LoadedBucketState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialBucketState implements BucketState {
  const factory InitialBucketState() = _$InitialBucketStateImpl;
}

/// @nodoc
abstract class _$$LoadingBucketStateImplCopyWith<$Res> {
  factory _$$LoadingBucketStateImplCopyWith(_$LoadingBucketStateImpl value,
          $Res Function(_$LoadingBucketStateImpl) then) =
      __$$LoadingBucketStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? msg});
}

/// @nodoc
class __$$LoadingBucketStateImplCopyWithImpl<$Res>
    extends _$BucketStateCopyWithImpl<$Res, _$LoadingBucketStateImpl>
    implements _$$LoadingBucketStateImplCopyWith<$Res> {
  __$$LoadingBucketStateImplCopyWithImpl(_$LoadingBucketStateImpl _value,
      $Res Function(_$LoadingBucketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$LoadingBucketStateImpl(
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadingBucketStateImpl implements LoadingBucketState {
  const _$LoadingBucketStateImpl({this.msg});

  @override
  final String? msg;

  @override
  String toString() {
    return 'BucketState.loading(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingBucketStateImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingBucketStateImplCopyWith<_$LoadingBucketStateImpl> get copyWith =>
      __$$LoadingBucketStateImplCopyWithImpl<_$LoadingBucketStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<Bucket> bucket, int? workOnIndex, String? msg)
        loaded,
  }) {
    return loading(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
  }) {
    return loading?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
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
    required TResult Function(InitialBucketState value) initial,
    required TResult Function(LoadingBucketState value) loading,
    required TResult Function(ErrorBucketState value) error,
    required TResult Function(LoadedBucketState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBucketState value)? initial,
    TResult? Function(LoadingBucketState value)? loading,
    TResult? Function(ErrorBucketState value)? error,
    TResult? Function(LoadedBucketState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBucketState value)? initial,
    TResult Function(LoadingBucketState value)? loading,
    TResult Function(ErrorBucketState value)? error,
    TResult Function(LoadedBucketState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingBucketState implements BucketState {
  const factory LoadingBucketState({final String? msg}) =
      _$LoadingBucketStateImpl;

  String? get msg;

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingBucketStateImplCopyWith<_$LoadingBucketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorBucketStateImplCopyWith<$Res> {
  factory _$$ErrorBucketStateImplCopyWith(_$ErrorBucketStateImpl value,
          $Res Function(_$ErrorBucketStateImpl) then) =
      __$$ErrorBucketStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$ErrorBucketStateImplCopyWithImpl<$Res>
    extends _$BucketStateCopyWithImpl<$Res, _$ErrorBucketStateImpl>
    implements _$$ErrorBucketStateImplCopyWith<$Res> {
  __$$ErrorBucketStateImplCopyWithImpl(_$ErrorBucketStateImpl _value,
      $Res Function(_$ErrorBucketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$ErrorBucketStateImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorBucketStateImpl implements ErrorBucketState {
  const _$ErrorBucketStateImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'BucketState.error(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorBucketStateImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorBucketStateImplCopyWith<_$ErrorBucketStateImpl> get copyWith =>
      __$$ErrorBucketStateImplCopyWithImpl<_$ErrorBucketStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<Bucket> bucket, int? workOnIndex, String? msg)
        loaded,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
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
    required TResult Function(InitialBucketState value) initial,
    required TResult Function(LoadingBucketState value) loading,
    required TResult Function(ErrorBucketState value) error,
    required TResult Function(LoadedBucketState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBucketState value)? initial,
    TResult? Function(LoadingBucketState value)? loading,
    TResult? Function(ErrorBucketState value)? error,
    TResult? Function(LoadedBucketState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBucketState value)? initial,
    TResult Function(LoadingBucketState value)? loading,
    TResult Function(ErrorBucketState value)? error,
    TResult Function(LoadedBucketState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorBucketState implements BucketState {
  const factory ErrorBucketState({required final String msg}) =
      _$ErrorBucketStateImpl;

  String get msg;

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorBucketStateImplCopyWith<_$ErrorBucketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedBucketStateImplCopyWith<$Res> {
  factory _$$LoadedBucketStateImplCopyWith(_$LoadedBucketStateImpl value,
          $Res Function(_$LoadedBucketStateImpl) then) =
      __$$LoadedBucketStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Bucket> bucket, int? workOnIndex, String? msg});
}

/// @nodoc
class __$$LoadedBucketStateImplCopyWithImpl<$Res>
    extends _$BucketStateCopyWithImpl<$Res, _$LoadedBucketStateImpl>
    implements _$$LoadedBucketStateImplCopyWith<$Res> {
  __$$LoadedBucketStateImplCopyWithImpl(_$LoadedBucketStateImpl _value,
      $Res Function(_$LoadedBucketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bucket = null,
    Object? workOnIndex = freezed,
    Object? msg = freezed,
  }) {
    return _then(_$LoadedBucketStateImpl(
      bucket: null == bucket
          ? _value._bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as List<Bucket>,
      workOnIndex: freezed == workOnIndex
          ? _value.workOnIndex
          : workOnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedBucketStateImpl implements LoadedBucketState {
  const _$LoadedBucketStateImpl(
      {required final List<Bucket> bucket, this.workOnIndex, this.msg})
      : _bucket = bucket;

  final List<Bucket> _bucket;
  @override
  List<Bucket> get bucket {
    if (_bucket is EqualUnmodifiableListView) return _bucket;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bucket);
  }

  @override
  final int? workOnIndex;
  @override
  final String? msg;

  @override
  String toString() {
    return 'BucketState.loaded(bucket: $bucket, workOnIndex: $workOnIndex, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedBucketStateImpl &&
            const DeepCollectionEquality().equals(other._bucket, _bucket) &&
            (identical(other.workOnIndex, workOnIndex) ||
                other.workOnIndex == workOnIndex) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_bucket), workOnIndex, msg);

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedBucketStateImplCopyWith<_$LoadedBucketStateImpl> get copyWith =>
      __$$LoadedBucketStateImplCopyWithImpl<_$LoadedBucketStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<Bucket> bucket, int? workOnIndex, String? msg)
        loaded,
  }) {
    return loaded(bucket, workOnIndex, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
  }) {
    return loaded?.call(bucket, workOnIndex, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(List<Bucket> bucket, int? workOnIndex, String? msg)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(bucket, workOnIndex, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBucketState value) initial,
    required TResult Function(LoadingBucketState value) loading,
    required TResult Function(ErrorBucketState value) error,
    required TResult Function(LoadedBucketState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialBucketState value)? initial,
    TResult? Function(LoadingBucketState value)? loading,
    TResult? Function(ErrorBucketState value)? error,
    TResult? Function(LoadedBucketState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBucketState value)? initial,
    TResult Function(LoadingBucketState value)? loading,
    TResult Function(ErrorBucketState value)? error,
    TResult Function(LoadedBucketState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedBucketState implements BucketState {
  const factory LoadedBucketState(
      {required final List<Bucket> bucket,
      final int? workOnIndex,
      final String? msg}) = _$LoadedBucketStateImpl;

  List<Bucket> get bucket;
  int? get workOnIndex;
  String? get msg;

  /// Create a copy of BucketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedBucketStateImplCopyWith<_$LoadedBucketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
