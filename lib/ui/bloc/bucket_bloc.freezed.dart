// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bucket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BucketEvent {

 void Function()? get onSuccess; void Function()? get onCompleted;  Function(dynamic error)? get onError; String get orgId;
/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BucketEventCopyWith<BucketEvent> get copyWith => _$BucketEventCopyWithImpl<BucketEvent>(this as BucketEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BucketEvent&&(identical(other.onSuccess, onSuccess) || other.onSuccess == onSuccess)&&(identical(other.onCompleted, onCompleted) || other.onCompleted == onCompleted)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.orgId, orgId) || other.orgId == orgId));
}


@override
int get hashCode => Object.hash(runtimeType,onSuccess,onCompleted,onError,orgId);

@override
String toString() {
  return 'BucketEvent(onSuccess: $onSuccess, onCompleted: $onCompleted, onError: $onError, orgId: $orgId)';
}


}

/// @nodoc
abstract mixin class $BucketEventCopyWith<$Res>  {
  factory $BucketEventCopyWith(BucketEvent value, $Res Function(BucketEvent) _then) = _$BucketEventCopyWithImpl;
@useResult
$Res call({
 String orgId, void Function()? onCompleted, dynamic Function(dynamic)? onError, void Function()? onSuccess
});




}
/// @nodoc
class _$BucketEventCopyWithImpl<$Res>
    implements $BucketEventCopyWith<$Res> {
  _$BucketEventCopyWithImpl(this._self, this._then);

  final BucketEvent _self;
  final $Res Function(BucketEvent) _then;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = null,Object? onCompleted = freezed,Object? onError = freezed,Object? onSuccess = freezed,}) {
  return _then(_self.copyWith(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,onCompleted: freezed == onCompleted ? _self.onCompleted : onCompleted // ignore: cast_nullable_to_non_nullable
as void Function()?,onError: freezed == onError ? _self.onError! : onError // ignore: cast_nullable_to_non_nullable
as dynamic Function(dynamic)?,onSuccess: freezed == onSuccess ? _self.onSuccess : onSuccess // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}

}


/// @nodoc


class CreateBucket extends BucketEvent {
   CreateBucket(this.orgId, this.bucket, {final  void Function()? onCompleted, final  dynamic Function(dynamic)? onError, final  void Function()? onSuccess}): super._(onCompleted: onCompleted, onError: onError, onSuccess: onSuccess);
  

@override final  String orgId;
 final  Bucket bucket;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateBucketCopyWith<CreateBucket> get copyWith => _$CreateBucketCopyWithImpl<CreateBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateBucket&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.onCompleted, onCompleted) || other.onCompleted == onCompleted)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.onSuccess, onSuccess) || other.onSuccess == onSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,orgId,bucket,onCompleted,onError,onSuccess);

@override
String toString() {
  return 'BucketEvent.create(orgId: $orgId, bucket: $bucket, onCompleted: $onCompleted, onError: $onError, onSuccess: $onSuccess)';
}


}

/// @nodoc
abstract mixin class $CreateBucketCopyWith<$Res> implements $BucketEventCopyWith<$Res> {
  factory $CreateBucketCopyWith(CreateBucket value, $Res Function(CreateBucket) _then) = _$CreateBucketCopyWithImpl;
@override @useResult
$Res call({
 String orgId, Bucket bucket, void Function()? onCompleted, dynamic Function(dynamic)? onError, void Function()? onSuccess
});


$BucketCopyWith<$Res> get bucket;

}
/// @nodoc
class _$CreateBucketCopyWithImpl<$Res>
    implements $CreateBucketCopyWith<$Res> {
  _$CreateBucketCopyWithImpl(this._self, this._then);

  final CreateBucket _self;
  final $Res Function(CreateBucket) _then;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = null,Object? bucket = null,Object? onCompleted = freezed,Object? onError = freezed,Object? onSuccess = freezed,}) {
  return _then(CreateBucket(
null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as Bucket,onCompleted: freezed == onCompleted ? _self.onCompleted : onCompleted // ignore: cast_nullable_to_non_nullable
as void Function()?,onError: freezed == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as dynamic Function(dynamic)?,onSuccess: freezed == onSuccess ? _self.onSuccess : onSuccess // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BucketCopyWith<$Res> get bucket {
  
  return $BucketCopyWith<$Res>(_self.bucket, (value) {
    return _then(_self.copyWith(bucket: value));
  });
}
}

/// @nodoc


class UpdateBucket extends BucketEvent {
   UpdateBucket(this.orgId, this.bucket, {final  void Function()? onCompleted, final  dynamic Function(dynamic)? onError, final  void Function()? onSuccess}): super._(onCompleted: onCompleted, onError: onError, onSuccess: onSuccess);
  

@override final  String orgId;
 final  Bucket bucket;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBucketCopyWith<UpdateBucket> get copyWith => _$UpdateBucketCopyWithImpl<UpdateBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBucket&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.onCompleted, onCompleted) || other.onCompleted == onCompleted)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.onSuccess, onSuccess) || other.onSuccess == onSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,orgId,bucket,onCompleted,onError,onSuccess);

@override
String toString() {
  return 'BucketEvent.update(orgId: $orgId, bucket: $bucket, onCompleted: $onCompleted, onError: $onError, onSuccess: $onSuccess)';
}


}

/// @nodoc
abstract mixin class $UpdateBucketCopyWith<$Res> implements $BucketEventCopyWith<$Res> {
  factory $UpdateBucketCopyWith(UpdateBucket value, $Res Function(UpdateBucket) _then) = _$UpdateBucketCopyWithImpl;
@override @useResult
$Res call({
 String orgId, Bucket bucket, void Function()? onCompleted, dynamic Function(dynamic)? onError, void Function()? onSuccess
});


$BucketCopyWith<$Res> get bucket;

}
/// @nodoc
class _$UpdateBucketCopyWithImpl<$Res>
    implements $UpdateBucketCopyWith<$Res> {
  _$UpdateBucketCopyWithImpl(this._self, this._then);

  final UpdateBucket _self;
  final $Res Function(UpdateBucket) _then;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = null,Object? bucket = null,Object? onCompleted = freezed,Object? onError = freezed,Object? onSuccess = freezed,}) {
  return _then(UpdateBucket(
null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as Bucket,onCompleted: freezed == onCompleted ? _self.onCompleted : onCompleted // ignore: cast_nullable_to_non_nullable
as void Function()?,onError: freezed == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as dynamic Function(dynamic)?,onSuccess: freezed == onSuccess ? _self.onSuccess : onSuccess // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BucketCopyWith<$Res> get bucket {
  
  return $BucketCopyWith<$Res>(_self.bucket, (value) {
    return _then(_self.copyWith(bucket: value));
  });
}
}

/// @nodoc


class DeleteBucket extends BucketEvent {
   DeleteBucket(this.orgId, this.bucketId, {final  void Function()? onCompleted, final  dynamic Function(dynamic)? onError, final  void Function()? onSuccess}): super._(onCompleted: onCompleted, onError: onError, onSuccess: onSuccess);
  

@override final  String orgId;
 final  String bucketId;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteBucketCopyWith<DeleteBucket> get copyWith => _$DeleteBucketCopyWithImpl<DeleteBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteBucket&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId)&&(identical(other.onCompleted, onCompleted) || other.onCompleted == onCompleted)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.onSuccess, onSuccess) || other.onSuccess == onSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,orgId,bucketId,onCompleted,onError,onSuccess);

@override
String toString() {
  return 'BucketEvent.delete(orgId: $orgId, bucketId: $bucketId, onCompleted: $onCompleted, onError: $onError, onSuccess: $onSuccess)';
}


}

/// @nodoc
abstract mixin class $DeleteBucketCopyWith<$Res> implements $BucketEventCopyWith<$Res> {
  factory $DeleteBucketCopyWith(DeleteBucket value, $Res Function(DeleteBucket) _then) = _$DeleteBucketCopyWithImpl;
@override @useResult
$Res call({
 String orgId, String bucketId, void Function()? onCompleted, dynamic Function(dynamic)? onError, void Function()? onSuccess
});




}
/// @nodoc
class _$DeleteBucketCopyWithImpl<$Res>
    implements $DeleteBucketCopyWith<$Res> {
  _$DeleteBucketCopyWithImpl(this._self, this._then);

  final DeleteBucket _self;
  final $Res Function(DeleteBucket) _then;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = null,Object? bucketId = null,Object? onCompleted = freezed,Object? onError = freezed,Object? onSuccess = freezed,}) {
  return _then(DeleteBucket(
null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,null == bucketId ? _self.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String,onCompleted: freezed == onCompleted ? _self.onCompleted : onCompleted // ignore: cast_nullable_to_non_nullable
as void Function()?,onError: freezed == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as dynamic Function(dynamic)?,onSuccess: freezed == onSuccess ? _self.onSuccess : onSuccess // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc


class LoadOrgBuckets extends BucketEvent {
   LoadOrgBuckets(this.orgId, {final  void Function()? onCompleted, final  dynamic Function(dynamic)? onError, final  void Function()? onSuccess}): super._(onCompleted: onCompleted, onError: onError, onSuccess: onSuccess);
  

@override final  String orgId;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadOrgBucketsCopyWith<LoadOrgBuckets> get copyWith => _$LoadOrgBucketsCopyWithImpl<LoadOrgBuckets>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadOrgBuckets&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.onCompleted, onCompleted) || other.onCompleted == onCompleted)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.onSuccess, onSuccess) || other.onSuccess == onSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,orgId,onCompleted,onError,onSuccess);

@override
String toString() {
  return 'BucketEvent.loadOrgBuckets(orgId: $orgId, onCompleted: $onCompleted, onError: $onError, onSuccess: $onSuccess)';
}


}

/// @nodoc
abstract mixin class $LoadOrgBucketsCopyWith<$Res> implements $BucketEventCopyWith<$Res> {
  factory $LoadOrgBucketsCopyWith(LoadOrgBuckets value, $Res Function(LoadOrgBuckets) _then) = _$LoadOrgBucketsCopyWithImpl;
@override @useResult
$Res call({
 String orgId, void Function()? onCompleted, dynamic Function(dynamic)? onError, void Function()? onSuccess
});




}
/// @nodoc
class _$LoadOrgBucketsCopyWithImpl<$Res>
    implements $LoadOrgBucketsCopyWith<$Res> {
  _$LoadOrgBucketsCopyWithImpl(this._self, this._then);

  final LoadOrgBuckets _self;
  final $Res Function(LoadOrgBuckets) _then;

/// Create a copy of BucketEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = null,Object? onCompleted = freezed,Object? onError = freezed,Object? onSuccess = freezed,}) {
  return _then(LoadOrgBuckets(
null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,onCompleted: freezed == onCompleted ? _self.onCompleted : onCompleted // ignore: cast_nullable_to_non_nullable
as void Function()?,onError: freezed == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as dynamic Function(dynamic)?,onSuccess: freezed == onSuccess ? _self.onSuccess : onSuccess // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}


}

/// @nodoc
mixin _$BucketState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BucketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BucketState()';
}


}

/// @nodoc
class $BucketStateCopyWith<$Res>  {
$BucketStateCopyWith(BucketState _, $Res Function(BucketState) __);
}


/// @nodoc


class InitialBucketState implements BucketState {
  const InitialBucketState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialBucketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BucketState.initial()';
}


}




/// @nodoc


class LoadingBucketState implements BucketState {
  const LoadingBucketState({this.msg});
  

 final  String? msg;

/// Create a copy of BucketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingBucketStateCopyWith<LoadingBucketState> get copyWith => _$LoadingBucketStateCopyWithImpl<LoadingBucketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingBucketState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'BucketState.loading(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $LoadingBucketStateCopyWith<$Res> implements $BucketStateCopyWith<$Res> {
  factory $LoadingBucketStateCopyWith(LoadingBucketState value, $Res Function(LoadingBucketState) _then) = _$LoadingBucketStateCopyWithImpl;
@useResult
$Res call({
 String? msg
});




}
/// @nodoc
class _$LoadingBucketStateCopyWithImpl<$Res>
    implements $LoadingBucketStateCopyWith<$Res> {
  _$LoadingBucketStateCopyWithImpl(this._self, this._then);

  final LoadingBucketState _self;
  final $Res Function(LoadingBucketState) _then;

/// Create a copy of BucketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = freezed,}) {
  return _then(LoadingBucketState(
msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ErrorBucketState implements BucketState {
  const ErrorBucketState({required this.msg});
  

 final  String msg;

/// Create a copy of BucketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorBucketStateCopyWith<ErrorBucketState> get copyWith => _$ErrorBucketStateCopyWithImpl<ErrorBucketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorBucketState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'BucketState.error(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $ErrorBucketStateCopyWith<$Res> implements $BucketStateCopyWith<$Res> {
  factory $ErrorBucketStateCopyWith(ErrorBucketState value, $Res Function(ErrorBucketState) _then) = _$ErrorBucketStateCopyWithImpl;
@useResult
$Res call({
 String msg
});




}
/// @nodoc
class _$ErrorBucketStateCopyWithImpl<$Res>
    implements $ErrorBucketStateCopyWith<$Res> {
  _$ErrorBucketStateCopyWithImpl(this._self, this._then);

  final ErrorBucketState _self;
  final $Res Function(ErrorBucketState) _then;

/// Create a copy of BucketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = null,}) {
  return _then(ErrorBucketState(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadedBucketState implements BucketState {
  const LoadedBucketState({required final  List<Bucket> bucket, this.workOnIndex, this.msg}): _bucket = bucket;
  

 final  List<Bucket> _bucket;
 List<Bucket> get bucket {
  if (_bucket is EqualUnmodifiableListView) return _bucket;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bucket);
}

 final  int? workOnIndex;
 final  String? msg;

/// Create a copy of BucketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedBucketStateCopyWith<LoadedBucketState> get copyWith => _$LoadedBucketStateCopyWithImpl<LoadedBucketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedBucketState&&const DeepCollectionEquality().equals(other._bucket, _bucket)&&(identical(other.workOnIndex, workOnIndex) || other.workOnIndex == workOnIndex)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bucket),workOnIndex,msg);

@override
String toString() {
  return 'BucketState.loaded(bucket: $bucket, workOnIndex: $workOnIndex, msg: $msg)';
}


}

/// @nodoc
abstract mixin class $LoadedBucketStateCopyWith<$Res> implements $BucketStateCopyWith<$Res> {
  factory $LoadedBucketStateCopyWith(LoadedBucketState value, $Res Function(LoadedBucketState) _then) = _$LoadedBucketStateCopyWithImpl;
@useResult
$Res call({
 List<Bucket> bucket, int? workOnIndex, String? msg
});




}
/// @nodoc
class _$LoadedBucketStateCopyWithImpl<$Res>
    implements $LoadedBucketStateCopyWith<$Res> {
  _$LoadedBucketStateCopyWithImpl(this._self, this._then);

  final LoadedBucketState _self;
  final $Res Function(LoadedBucketState) _then;

/// Create a copy of BucketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bucket = null,Object? workOnIndex = freezed,Object? msg = freezed,}) {
  return _then(LoadedBucketState(
bucket: null == bucket ? _self._bucket : bucket // ignore: cast_nullable_to_non_nullable
as List<Bucket>,workOnIndex: freezed == workOnIndex ? _self.workOnIndex : workOnIndex // ignore: cast_nullable_to_non_nullable
as int?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
