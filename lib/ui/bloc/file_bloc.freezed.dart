// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileEvent()';
}


}

/// @nodoc
class $FileEventCopyWith<$Res>  {
$FileEventCopyWith(FileEvent _, $Res Function(FileEvent) __);
}


/// @nodoc


class CreateFileEvent implements FileEvent {
  const CreateFileEvent(this.file);
  

 final  DocumentFile file;

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateFileEventCopyWith<CreateFileEvent> get copyWith => _$CreateFileEventCopyWithImpl<CreateFileEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateFileEvent&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'FileEvent.create(file: $file)';
}


}

/// @nodoc
abstract mixin class $CreateFileEventCopyWith<$Res> implements $FileEventCopyWith<$Res> {
  factory $CreateFileEventCopyWith(CreateFileEvent value, $Res Function(CreateFileEvent) _then) = _$CreateFileEventCopyWithImpl;
@useResult
$Res call({
 DocumentFile file
});


$DocumentFileCopyWith<$Res> get file;

}
/// @nodoc
class _$CreateFileEventCopyWithImpl<$Res>
    implements $CreateFileEventCopyWith<$Res> {
  _$CreateFileEventCopyWithImpl(this._self, this._then);

  final CreateFileEvent _self;
  final $Res Function(CreateFileEvent) _then;

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(CreateFileEvent(
null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as DocumentFile,
  ));
}

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentFileCopyWith<$Res> get file {
  
  return $DocumentFileCopyWith<$Res>(_self.file, (value) {
    return _then(_self.copyWith(file: value));
  });
}
}

/// @nodoc


class UpdateFileEvent implements FileEvent {
  const UpdateFileEvent(this.file);
  

 final  DocumentFile file;

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateFileEventCopyWith<UpdateFileEvent> get copyWith => _$UpdateFileEventCopyWithImpl<UpdateFileEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateFileEvent&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'FileEvent.update(file: $file)';
}


}

/// @nodoc
abstract mixin class $UpdateFileEventCopyWith<$Res> implements $FileEventCopyWith<$Res> {
  factory $UpdateFileEventCopyWith(UpdateFileEvent value, $Res Function(UpdateFileEvent) _then) = _$UpdateFileEventCopyWithImpl;
@useResult
$Res call({
 DocumentFile file
});


$DocumentFileCopyWith<$Res> get file;

}
/// @nodoc
class _$UpdateFileEventCopyWithImpl<$Res>
    implements $UpdateFileEventCopyWith<$Res> {
  _$UpdateFileEventCopyWithImpl(this._self, this._then);

  final UpdateFileEvent _self;
  final $Res Function(UpdateFileEvent) _then;

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(UpdateFileEvent(
null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as DocumentFile,
  ));
}

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentFileCopyWith<$Res> get file {
  
  return $DocumentFileCopyWith<$Res>(_self.file, (value) {
    return _then(_self.copyWith(file: value));
  });
}
}

/// @nodoc


class DeleteFileEvent implements FileEvent {
  const DeleteFileEvent(this.fileId);
  

 final  String fileId;

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteFileEventCopyWith<DeleteFileEvent> get copyWith => _$DeleteFileEventCopyWithImpl<DeleteFileEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteFileEvent&&(identical(other.fileId, fileId) || other.fileId == fileId));
}


@override
int get hashCode => Object.hash(runtimeType,fileId);

@override
String toString() {
  return 'FileEvent.delete(fileId: $fileId)';
}


}

/// @nodoc
abstract mixin class $DeleteFileEventCopyWith<$Res> implements $FileEventCopyWith<$Res> {
  factory $DeleteFileEventCopyWith(DeleteFileEvent value, $Res Function(DeleteFileEvent) _then) = _$DeleteFileEventCopyWithImpl;
@useResult
$Res call({
 String fileId
});




}
/// @nodoc
class _$DeleteFileEventCopyWithImpl<$Res>
    implements $DeleteFileEventCopyWith<$Res> {
  _$DeleteFileEventCopyWithImpl(this._self, this._then);

  final DeleteFileEvent _self;
  final $Res Function(DeleteFileEvent) _then;

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fileId = null,}) {
  return _then(DeleteFileEvent(
null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadBucketFilesEvent implements FileEvent {
  const LoadBucketFilesEvent(this.bucketId);
  

 final  String bucketId;

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadBucketFilesEventCopyWith<LoadBucketFilesEvent> get copyWith => _$LoadBucketFilesEventCopyWithImpl<LoadBucketFilesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadBucketFilesEvent&&(identical(other.bucketId, bucketId) || other.bucketId == bucketId));
}


@override
int get hashCode => Object.hash(runtimeType,bucketId);

@override
String toString() {
  return 'FileEvent.loadBucketFiles(bucketId: $bucketId)';
}


}

/// @nodoc
abstract mixin class $LoadBucketFilesEventCopyWith<$Res> implements $FileEventCopyWith<$Res> {
  factory $LoadBucketFilesEventCopyWith(LoadBucketFilesEvent value, $Res Function(LoadBucketFilesEvent) _then) = _$LoadBucketFilesEventCopyWithImpl;
@useResult
$Res call({
 String bucketId
});




}
/// @nodoc
class _$LoadBucketFilesEventCopyWithImpl<$Res>
    implements $LoadBucketFilesEventCopyWith<$Res> {
  _$LoadBucketFilesEventCopyWithImpl(this._self, this._then);

  final LoadBucketFilesEvent _self;
  final $Res Function(LoadBucketFilesEvent) _then;

/// Create a copy of FileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bucketId = null,}) {
  return _then(LoadBucketFilesEvent(
null == bucketId ? _self.bucketId : bucketId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileState()';
}


}

/// @nodoc
class $FileStateCopyWith<$Res>  {
$FileStateCopyWith(FileState _, $Res Function(FileState) __);
}


/// @nodoc


class FileInitialState implements FileState {
  const FileInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileState.initial()';
}


}




/// @nodoc


class FileLoadingState implements FileState {
  const FileLoadingState({this.msg});
  

 final  String? msg;

/// Create a copy of FileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileLoadingStateCopyWith<FileLoadingState> get copyWith => _$FileLoadingStateCopyWithImpl<FileLoadingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileLoadingState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'FileState.loading(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $FileLoadingStateCopyWith<$Res> implements $FileStateCopyWith<$Res> {
  factory $FileLoadingStateCopyWith(FileLoadingState value, $Res Function(FileLoadingState) _then) = _$FileLoadingStateCopyWithImpl;
@useResult
$Res call({
 String? msg
});




}
/// @nodoc
class _$FileLoadingStateCopyWithImpl<$Res>
    implements $FileLoadingStateCopyWith<$Res> {
  _$FileLoadingStateCopyWithImpl(this._self, this._then);

  final FileLoadingState _self;
  final $Res Function(FileLoadingState) _then;

/// Create a copy of FileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = freezed,}) {
  return _then(FileLoadingState(
msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FileErrorState implements FileState {
  const FileErrorState({required this.msg});
  

 final  String msg;

/// Create a copy of FileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileErrorStateCopyWith<FileErrorState> get copyWith => _$FileErrorStateCopyWithImpl<FileErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileErrorState&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'FileState.error(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $FileErrorStateCopyWith<$Res> implements $FileStateCopyWith<$Res> {
  factory $FileErrorStateCopyWith(FileErrorState value, $Res Function(FileErrorState) _then) = _$FileErrorStateCopyWithImpl;
@useResult
$Res call({
 String msg
});




}
/// @nodoc
class _$FileErrorStateCopyWithImpl<$Res>
    implements $FileErrorStateCopyWith<$Res> {
  _$FileErrorStateCopyWithImpl(this._self, this._then);

  final FileErrorState _self;
  final $Res Function(FileErrorState) _then;

/// Create a copy of FileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = null,}) {
  return _then(FileErrorState(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FileLoadedState implements FileState {
  const FileLoadedState({required final  List<DocumentFile> file, this.workOnIndex, this.msg}): _file = file;
  

 final  List<DocumentFile> _file;
 List<DocumentFile> get file {
  if (_file is EqualUnmodifiableListView) return _file;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_file);
}

 final  int? workOnIndex;
 final  String? msg;

/// Create a copy of FileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileLoadedStateCopyWith<FileLoadedState> get copyWith => _$FileLoadedStateCopyWithImpl<FileLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileLoadedState&&const DeepCollectionEquality().equals(other._file, _file)&&(identical(other.workOnIndex, workOnIndex) || other.workOnIndex == workOnIndex)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_file),workOnIndex,msg);

@override
String toString() {
  return 'FileState.loaded(file: $file, workOnIndex: $workOnIndex, msg: $msg)';
}


}

/// @nodoc
abstract mixin class $FileLoadedStateCopyWith<$Res> implements $FileStateCopyWith<$Res> {
  factory $FileLoadedStateCopyWith(FileLoadedState value, $Res Function(FileLoadedState) _then) = _$FileLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<DocumentFile> file, int? workOnIndex, String? msg
});




}
/// @nodoc
class _$FileLoadedStateCopyWithImpl<$Res>
    implements $FileLoadedStateCopyWith<$Res> {
  _$FileLoadedStateCopyWithImpl(this._self, this._then);

  final FileLoadedState _self;
  final $Res Function(FileLoadedState) _then;

/// Create a copy of FileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,Object? workOnIndex = freezed,Object? msg = freezed,}) {
  return _then(FileLoadedState(
file: null == file ? _self._file : file // ignore: cast_nullable_to_non_nullable
as List<DocumentFile>,workOnIndex: freezed == workOnIndex ? _self.workOnIndex : workOnIndex // ignore: cast_nullable_to_non_nullable
as int?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
