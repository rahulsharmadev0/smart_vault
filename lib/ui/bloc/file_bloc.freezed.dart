// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DocumentFile file) create,
    required TResult Function(DocumentFile file) update,
    required TResult Function(String fileId) delete,
    required TResult Function(String bucketId) loadBucketFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DocumentFile file)? create,
    TResult? Function(DocumentFile file)? update,
    TResult? Function(String fileId)? delete,
    TResult? Function(String bucketId)? loadBucketFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DocumentFile file)? create,
    TResult Function(DocumentFile file)? update,
    TResult Function(String fileId)? delete,
    TResult Function(String bucketId)? loadBucketFiles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFileEvent value) create,
    required TResult Function(UpdateFileEvent value) update,
    required TResult Function(DeleteFileEvent value) delete,
    required TResult Function(LoadBucketFilesEvent value) loadBucketFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFileEvent value)? create,
    TResult? Function(UpdateFileEvent value)? update,
    TResult? Function(DeleteFileEvent value)? delete,
    TResult? Function(LoadBucketFilesEvent value)? loadBucketFiles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFileEvent value)? create,
    TResult Function(UpdateFileEvent value)? update,
    TResult Function(DeleteFileEvent value)? delete,
    TResult Function(LoadBucketFilesEvent value)? loadBucketFiles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileEventCopyWith<$Res> {
  factory $FileEventCopyWith(FileEvent value, $Res Function(FileEvent) then) =
      _$FileEventCopyWithImpl<$Res, FileEvent>;
}

/// @nodoc
class _$FileEventCopyWithImpl<$Res, $Val extends FileEvent>
    implements $FileEventCopyWith<$Res> {
  _$FileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateFileEventImplCopyWith<$Res> {
  factory _$$CreateFileEventImplCopyWith(_$CreateFileEventImpl value,
          $Res Function(_$CreateFileEventImpl) then) =
      __$$CreateFileEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DocumentFile file});

  $DocumentFileCopyWith<$Res> get file;
}

/// @nodoc
class __$$CreateFileEventImplCopyWithImpl<$Res>
    extends _$FileEventCopyWithImpl<$Res, _$CreateFileEventImpl>
    implements _$$CreateFileEventImplCopyWith<$Res> {
  __$$CreateFileEventImplCopyWithImpl(
      _$CreateFileEventImpl _value, $Res Function(_$CreateFileEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$CreateFileEventImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as DocumentFile,
    ));
  }

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentFileCopyWith<$Res> get file {
    return $DocumentFileCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value));
    });
  }
}

/// @nodoc

class _$CreateFileEventImpl implements CreateFileEvent {
  const _$CreateFileEventImpl(this.file);

  @override
  final DocumentFile file;

  @override
  String toString() {
    return 'FileEvent.create(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFileEventImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFileEventImplCopyWith<_$CreateFileEventImpl> get copyWith =>
      __$$CreateFileEventImplCopyWithImpl<_$CreateFileEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DocumentFile file) create,
    required TResult Function(DocumentFile file) update,
    required TResult Function(String fileId) delete,
    required TResult Function(String bucketId) loadBucketFiles,
  }) {
    return create(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DocumentFile file)? create,
    TResult? Function(DocumentFile file)? update,
    TResult? Function(String fileId)? delete,
    TResult? Function(String bucketId)? loadBucketFiles,
  }) {
    return create?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DocumentFile file)? create,
    TResult Function(DocumentFile file)? update,
    TResult Function(String fileId)? delete,
    TResult Function(String bucketId)? loadBucketFiles,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFileEvent value) create,
    required TResult Function(UpdateFileEvent value) update,
    required TResult Function(DeleteFileEvent value) delete,
    required TResult Function(LoadBucketFilesEvent value) loadBucketFiles,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFileEvent value)? create,
    TResult? Function(UpdateFileEvent value)? update,
    TResult? Function(DeleteFileEvent value)? delete,
    TResult? Function(LoadBucketFilesEvent value)? loadBucketFiles,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFileEvent value)? create,
    TResult Function(UpdateFileEvent value)? update,
    TResult Function(DeleteFileEvent value)? delete,
    TResult Function(LoadBucketFilesEvent value)? loadBucketFiles,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateFileEvent implements FileEvent {
  const factory CreateFileEvent(final DocumentFile file) =
      _$CreateFileEventImpl;

  DocumentFile get file;

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFileEventImplCopyWith<_$CreateFileEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateFileEventImplCopyWith<$Res> {
  factory _$$UpdateFileEventImplCopyWith(_$UpdateFileEventImpl value,
          $Res Function(_$UpdateFileEventImpl) then) =
      __$$UpdateFileEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DocumentFile file});

  $DocumentFileCopyWith<$Res> get file;
}

/// @nodoc
class __$$UpdateFileEventImplCopyWithImpl<$Res>
    extends _$FileEventCopyWithImpl<$Res, _$UpdateFileEventImpl>
    implements _$$UpdateFileEventImplCopyWith<$Res> {
  __$$UpdateFileEventImplCopyWithImpl(
      _$UpdateFileEventImpl _value, $Res Function(_$UpdateFileEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$UpdateFileEventImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as DocumentFile,
    ));
  }

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentFileCopyWith<$Res> get file {
    return $DocumentFileCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value));
    });
  }
}

/// @nodoc

class _$UpdateFileEventImpl implements UpdateFileEvent {
  const _$UpdateFileEventImpl(this.file);

  @override
  final DocumentFile file;

  @override
  String toString() {
    return 'FileEvent.update(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFileEventImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFileEventImplCopyWith<_$UpdateFileEventImpl> get copyWith =>
      __$$UpdateFileEventImplCopyWithImpl<_$UpdateFileEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DocumentFile file) create,
    required TResult Function(DocumentFile file) update,
    required TResult Function(String fileId) delete,
    required TResult Function(String bucketId) loadBucketFiles,
  }) {
    return update(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DocumentFile file)? create,
    TResult? Function(DocumentFile file)? update,
    TResult? Function(String fileId)? delete,
    TResult? Function(String bucketId)? loadBucketFiles,
  }) {
    return update?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DocumentFile file)? create,
    TResult Function(DocumentFile file)? update,
    TResult Function(String fileId)? delete,
    TResult Function(String bucketId)? loadBucketFiles,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFileEvent value) create,
    required TResult Function(UpdateFileEvent value) update,
    required TResult Function(DeleteFileEvent value) delete,
    required TResult Function(LoadBucketFilesEvent value) loadBucketFiles,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFileEvent value)? create,
    TResult? Function(UpdateFileEvent value)? update,
    TResult? Function(DeleteFileEvent value)? delete,
    TResult? Function(LoadBucketFilesEvent value)? loadBucketFiles,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFileEvent value)? create,
    TResult Function(UpdateFileEvent value)? update,
    TResult Function(DeleteFileEvent value)? delete,
    TResult Function(LoadBucketFilesEvent value)? loadBucketFiles,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateFileEvent implements FileEvent {
  const factory UpdateFileEvent(final DocumentFile file) =
      _$UpdateFileEventImpl;

  DocumentFile get file;

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateFileEventImplCopyWith<_$UpdateFileEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteFileEventImplCopyWith<$Res> {
  factory _$$DeleteFileEventImplCopyWith(_$DeleteFileEventImpl value,
          $Res Function(_$DeleteFileEventImpl) then) =
      __$$DeleteFileEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileId});
}

/// @nodoc
class __$$DeleteFileEventImplCopyWithImpl<$Res>
    extends _$FileEventCopyWithImpl<$Res, _$DeleteFileEventImpl>
    implements _$$DeleteFileEventImplCopyWith<$Res> {
  __$$DeleteFileEventImplCopyWithImpl(
      _$DeleteFileEventImpl _value, $Res Function(_$DeleteFileEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
  }) {
    return _then(_$DeleteFileEventImpl(
      null == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteFileEventImpl implements DeleteFileEvent {
  const _$DeleteFileEventImpl(this.fileId);

  @override
  final String fileId;

  @override
  String toString() {
    return 'FileEvent.delete(fileId: $fileId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFileEventImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileId);

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteFileEventImplCopyWith<_$DeleteFileEventImpl> get copyWith =>
      __$$DeleteFileEventImplCopyWithImpl<_$DeleteFileEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DocumentFile file) create,
    required TResult Function(DocumentFile file) update,
    required TResult Function(String fileId) delete,
    required TResult Function(String bucketId) loadBucketFiles,
  }) {
    return delete(fileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DocumentFile file)? create,
    TResult? Function(DocumentFile file)? update,
    TResult? Function(String fileId)? delete,
    TResult? Function(String bucketId)? loadBucketFiles,
  }) {
    return delete?.call(fileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DocumentFile file)? create,
    TResult Function(DocumentFile file)? update,
    TResult Function(String fileId)? delete,
    TResult Function(String bucketId)? loadBucketFiles,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(fileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFileEvent value) create,
    required TResult Function(UpdateFileEvent value) update,
    required TResult Function(DeleteFileEvent value) delete,
    required TResult Function(LoadBucketFilesEvent value) loadBucketFiles,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFileEvent value)? create,
    TResult? Function(UpdateFileEvent value)? update,
    TResult? Function(DeleteFileEvent value)? delete,
    TResult? Function(LoadBucketFilesEvent value)? loadBucketFiles,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFileEvent value)? create,
    TResult Function(UpdateFileEvent value)? update,
    TResult Function(DeleteFileEvent value)? delete,
    TResult Function(LoadBucketFilesEvent value)? loadBucketFiles,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteFileEvent implements FileEvent {
  const factory DeleteFileEvent(final String fileId) = _$DeleteFileEventImpl;

  String get fileId;

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteFileEventImplCopyWith<_$DeleteFileEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadBucketFilesEventImplCopyWith<$Res> {
  factory _$$LoadBucketFilesEventImplCopyWith(_$LoadBucketFilesEventImpl value,
          $Res Function(_$LoadBucketFilesEventImpl) then) =
      __$$LoadBucketFilesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bucketId});
}

/// @nodoc
class __$$LoadBucketFilesEventImplCopyWithImpl<$Res>
    extends _$FileEventCopyWithImpl<$Res, _$LoadBucketFilesEventImpl>
    implements _$$LoadBucketFilesEventImplCopyWith<$Res> {
  __$$LoadBucketFilesEventImplCopyWithImpl(_$LoadBucketFilesEventImpl _value,
      $Res Function(_$LoadBucketFilesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bucketId = null,
  }) {
    return _then(_$LoadBucketFilesEventImpl(
      null == bucketId
          ? _value.bucketId
          : bucketId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadBucketFilesEventImpl implements LoadBucketFilesEvent {
  const _$LoadBucketFilesEventImpl(this.bucketId);

  @override
  final String bucketId;

  @override
  String toString() {
    return 'FileEvent.loadBucketFiles(bucketId: $bucketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadBucketFilesEventImpl &&
            (identical(other.bucketId, bucketId) ||
                other.bucketId == bucketId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bucketId);

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadBucketFilesEventImplCopyWith<_$LoadBucketFilesEventImpl>
      get copyWith =>
          __$$LoadBucketFilesEventImplCopyWithImpl<_$LoadBucketFilesEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DocumentFile file) create,
    required TResult Function(DocumentFile file) update,
    required TResult Function(String fileId) delete,
    required TResult Function(String bucketId) loadBucketFiles,
  }) {
    return loadBucketFiles(bucketId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DocumentFile file)? create,
    TResult? Function(DocumentFile file)? update,
    TResult? Function(String fileId)? delete,
    TResult? Function(String bucketId)? loadBucketFiles,
  }) {
    return loadBucketFiles?.call(bucketId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DocumentFile file)? create,
    TResult Function(DocumentFile file)? update,
    TResult Function(String fileId)? delete,
    TResult Function(String bucketId)? loadBucketFiles,
    required TResult orElse(),
  }) {
    if (loadBucketFiles != null) {
      return loadBucketFiles(bucketId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFileEvent value) create,
    required TResult Function(UpdateFileEvent value) update,
    required TResult Function(DeleteFileEvent value) delete,
    required TResult Function(LoadBucketFilesEvent value) loadBucketFiles,
  }) {
    return loadBucketFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFileEvent value)? create,
    TResult? Function(UpdateFileEvent value)? update,
    TResult? Function(DeleteFileEvent value)? delete,
    TResult? Function(LoadBucketFilesEvent value)? loadBucketFiles,
  }) {
    return loadBucketFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFileEvent value)? create,
    TResult Function(UpdateFileEvent value)? update,
    TResult Function(DeleteFileEvent value)? delete,
    TResult Function(LoadBucketFilesEvent value)? loadBucketFiles,
    required TResult orElse(),
  }) {
    if (loadBucketFiles != null) {
      return loadBucketFiles(this);
    }
    return orElse();
  }
}

abstract class LoadBucketFilesEvent implements FileEvent {
  const factory LoadBucketFilesEvent(final String bucketId) =
      _$LoadBucketFilesEventImpl;

  String get bucketId;

  /// Create a copy of FileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadBucketFilesEventImplCopyWith<_$LoadBucketFilesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<DocumentFile> file, int? workOnIndex, String? msg)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileInitialState value) initial,
    required TResult Function(FileLoadingState value) loading,
    required TResult Function(FileErrorState value) error,
    required TResult Function(FileLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileInitialState value)? initial,
    TResult? Function(FileLoadingState value)? loading,
    TResult? Function(FileErrorState value)? error,
    TResult? Function(FileLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileInitialState value)? initial,
    TResult Function(FileLoadingState value)? loading,
    TResult Function(FileErrorState value)? error,
    TResult Function(FileLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileStateCopyWith<$Res> {
  factory $FileStateCopyWith(FileState value, $Res Function(FileState) then) =
      _$FileStateCopyWithImpl<$Res, FileState>;
}

/// @nodoc
class _$FileStateCopyWithImpl<$Res, $Val extends FileState>
    implements $FileStateCopyWith<$Res> {
  _$FileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FileInitialStateImplCopyWith<$Res> {
  factory _$$FileInitialStateImplCopyWith(_$FileInitialStateImpl value,
          $Res Function(_$FileInitialStateImpl) then) =
      __$$FileInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FileInitialStateImplCopyWithImpl<$Res>
    extends _$FileStateCopyWithImpl<$Res, _$FileInitialStateImpl>
    implements _$$FileInitialStateImplCopyWith<$Res> {
  __$$FileInitialStateImplCopyWithImpl(_$FileInitialStateImpl _value,
      $Res Function(_$FileInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FileInitialStateImpl implements FileInitialState {
  const _$FileInitialStateImpl();

  @override
  String toString() {
    return 'FileState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FileInitialStateImpl);
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
            List<DocumentFile> file, int? workOnIndex, String? msg)
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
    TResult? Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
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
    TResult Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
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
    required TResult Function(FileInitialState value) initial,
    required TResult Function(FileLoadingState value) loading,
    required TResult Function(FileErrorState value) error,
    required TResult Function(FileLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileInitialState value)? initial,
    TResult? Function(FileLoadingState value)? loading,
    TResult? Function(FileErrorState value)? error,
    TResult? Function(FileLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileInitialState value)? initial,
    TResult Function(FileLoadingState value)? loading,
    TResult Function(FileErrorState value)? error,
    TResult Function(FileLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FileInitialState implements FileState {
  const factory FileInitialState() = _$FileInitialStateImpl;
}

/// @nodoc
abstract class _$$FileLoadingStateImplCopyWith<$Res> {
  factory _$$FileLoadingStateImplCopyWith(_$FileLoadingStateImpl value,
          $Res Function(_$FileLoadingStateImpl) then) =
      __$$FileLoadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? msg});
}

/// @nodoc
class __$$FileLoadingStateImplCopyWithImpl<$Res>
    extends _$FileStateCopyWithImpl<$Res, _$FileLoadingStateImpl>
    implements _$$FileLoadingStateImplCopyWith<$Res> {
  __$$FileLoadingStateImplCopyWithImpl(_$FileLoadingStateImpl _value,
      $Res Function(_$FileLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$FileLoadingStateImpl(
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FileLoadingStateImpl implements FileLoadingState {
  const _$FileLoadingStateImpl({this.msg});

  @override
  final String? msg;

  @override
  String toString() {
    return 'FileState.loading(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileLoadingStateImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileLoadingStateImplCopyWith<_$FileLoadingStateImpl> get copyWith =>
      __$$FileLoadingStateImplCopyWithImpl<_$FileLoadingStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<DocumentFile> file, int? workOnIndex, String? msg)
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
    TResult? Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
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
    TResult Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
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
    required TResult Function(FileInitialState value) initial,
    required TResult Function(FileLoadingState value) loading,
    required TResult Function(FileErrorState value) error,
    required TResult Function(FileLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileInitialState value)? initial,
    TResult? Function(FileLoadingState value)? loading,
    TResult? Function(FileErrorState value)? error,
    TResult? Function(FileLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileInitialState value)? initial,
    TResult Function(FileLoadingState value)? loading,
    TResult Function(FileErrorState value)? error,
    TResult Function(FileLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FileLoadingState implements FileState {
  const factory FileLoadingState({final String? msg}) = _$FileLoadingStateImpl;

  String? get msg;

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileLoadingStateImplCopyWith<_$FileLoadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileErrorStateImplCopyWith<$Res> {
  factory _$$FileErrorStateImplCopyWith(_$FileErrorStateImpl value,
          $Res Function(_$FileErrorStateImpl) then) =
      __$$FileErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$FileErrorStateImplCopyWithImpl<$Res>
    extends _$FileStateCopyWithImpl<$Res, _$FileErrorStateImpl>
    implements _$$FileErrorStateImplCopyWith<$Res> {
  __$$FileErrorStateImplCopyWithImpl(
      _$FileErrorStateImpl _value, $Res Function(_$FileErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$FileErrorStateImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FileErrorStateImpl implements FileErrorState {
  const _$FileErrorStateImpl({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'FileState.error(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileErrorStateImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileErrorStateImplCopyWith<_$FileErrorStateImpl> get copyWith =>
      __$$FileErrorStateImplCopyWithImpl<_$FileErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<DocumentFile> file, int? workOnIndex, String? msg)
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
    TResult? Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
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
    TResult Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
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
    required TResult Function(FileInitialState value) initial,
    required TResult Function(FileLoadingState value) loading,
    required TResult Function(FileErrorState value) error,
    required TResult Function(FileLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileInitialState value)? initial,
    TResult? Function(FileLoadingState value)? loading,
    TResult? Function(FileErrorState value)? error,
    TResult? Function(FileLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileInitialState value)? initial,
    TResult Function(FileLoadingState value)? loading,
    TResult Function(FileErrorState value)? error,
    TResult Function(FileLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FileErrorState implements FileState {
  const factory FileErrorState({required final String msg}) =
      _$FileErrorStateImpl;

  String get msg;

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileErrorStateImplCopyWith<_$FileErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileLoadedStateImplCopyWith<$Res> {
  factory _$$FileLoadedStateImplCopyWith(_$FileLoadedStateImpl value,
          $Res Function(_$FileLoadedStateImpl) then) =
      __$$FileLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DocumentFile> file, int? workOnIndex, String? msg});
}

/// @nodoc
class __$$FileLoadedStateImplCopyWithImpl<$Res>
    extends _$FileStateCopyWithImpl<$Res, _$FileLoadedStateImpl>
    implements _$$FileLoadedStateImplCopyWith<$Res> {
  __$$FileLoadedStateImplCopyWithImpl(
      _$FileLoadedStateImpl _value, $Res Function(_$FileLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? workOnIndex = freezed,
    Object? msg = freezed,
  }) {
    return _then(_$FileLoadedStateImpl(
      file: null == file
          ? _value._file
          : file // ignore: cast_nullable_to_non_nullable
              as List<DocumentFile>,
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

class _$FileLoadedStateImpl implements FileLoadedState {
  const _$FileLoadedStateImpl(
      {required final List<DocumentFile> file, this.workOnIndex, this.msg})
      : _file = file;

  final List<DocumentFile> _file;
  @override
  List<DocumentFile> get file {
    if (_file is EqualUnmodifiableListView) return _file;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_file);
  }

  @override
  final int? workOnIndex;
  @override
  final String? msg;

  @override
  String toString() {
    return 'FileState.loaded(file: $file, workOnIndex: $workOnIndex, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._file, _file) &&
            (identical(other.workOnIndex, workOnIndex) ||
                other.workOnIndex == workOnIndex) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_file), workOnIndex, msg);

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileLoadedStateImplCopyWith<_$FileLoadedStateImpl> get copyWith =>
      __$$FileLoadedStateImplCopyWithImpl<_$FileLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? msg) loading,
    required TResult Function(String msg) error,
    required TResult Function(
            List<DocumentFile> file, int? workOnIndex, String? msg)
        loaded,
  }) {
    return loaded(file, workOnIndex, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? msg)? loading,
    TResult? Function(String msg)? error,
    TResult? Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
        loaded,
  }) {
    return loaded?.call(file, workOnIndex, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? msg)? loading,
    TResult Function(String msg)? error,
    TResult Function(List<DocumentFile> file, int? workOnIndex, String? msg)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(file, workOnIndex, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileInitialState value) initial,
    required TResult Function(FileLoadingState value) loading,
    required TResult Function(FileErrorState value) error,
    required TResult Function(FileLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileInitialState value)? initial,
    TResult? Function(FileLoadingState value)? loading,
    TResult? Function(FileErrorState value)? error,
    TResult? Function(FileLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileInitialState value)? initial,
    TResult Function(FileLoadingState value)? loading,
    TResult Function(FileErrorState value)? error,
    TResult Function(FileLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FileLoadedState implements FileState {
  const factory FileLoadedState(
      {required final List<DocumentFile> file,
      final int? workOnIndex,
      final String? msg}) = _$FileLoadedStateImpl;

  List<DocumentFile> get file;
  int? get workOnIndex;
  String? get msg;

  /// Create a copy of FileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileLoadedStateImplCopyWith<_$FileLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
