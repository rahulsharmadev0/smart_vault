import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/models.dart';
import 'package:repositories/repositories.dart';
import '_messages.dart';

part 'file_bloc.freezed.dart';

@freezed
sealed class FileEvent with _$FileEvent {
  const factory FileEvent.create(DocumentFile file) = CreateFileEvent;
  const factory FileEvent.update(DocumentFile file) = UpdateFileEvent;
  const factory FileEvent.delete(String fileId) = DeleteFileEvent;
  const factory FileEvent.loadBucketFiles(String bucketId) = LoadBucketFilesEvent;
}

@freezed
sealed class FileState with _$FileState {
  const factory FileState.initial() = FileInitialState;
  const factory FileState.loading({String? msg}) = FileLoadingState;
  const factory FileState.error({required String msg}) = FileErrorState;
  const factory FileState.loaded({required List<DocumentFile> file, int? workOnIndex, String? msg}) =
      FileLoadedState;
}

class FileBloc extends Bloc<FileEvent, FileState> {
  final FileRepository repo;
  List<DocumentFile> _cachedFiles = [];

  FileBloc({required this.repo}) : super(const FileState.initial()) {
    on<CreateFileEvent>(_onCreateFile);
    on<UpdateFileEvent>(_onUpdateFile);
    on<DeleteFileEvent>(_onDeleteFile);
    on<LoadBucketFilesEvent>(_onLoadFiles);
  }

  Future<void> _onCreateFile(CreateFileEvent event, Emitter<FileState> emit) async {
    try {
      emit(state.maybeMap(
        initial: (_) => const FileState.loading(),
        loaded: (state) => state.copyWith(msg: FileMessage.creating.message),
        orElse: () => state,
      ));

      await repo.create(event.file);
      _cachedFiles = [..._cachedFiles, event.file];

      emit(FileState.loaded(
        file: _cachedFiles,
        msg: FileMessage.created.message,
      ));
    } catch (e) {
      emit(state.maybeMap(
        initial: (_) => FileState.error(msg: FileMessage.creating.getErrorMessage(e)),
        loaded: (state) => state.copyWith(msg: FileMessage.creating.getErrorMessage(e)),
        orElse: () => state,
      ));
    }
  }

  Future<void> _onUpdateFile(UpdateFileEvent event, Emitter<FileState> emit) async {
    try {
      emit(state.maybeMap(
        initial: (_) => FileState.loading(msg: FileMessage.updating.message),
        loaded: (state) => state.copyWith(
          msg: FileMessage.updating.message,
          workOnIndex: state.file.indexWhere((file) => file.fileId == event.file.fileId),
        ),
        orElse: () => state,
      ));

      await repo.update(event.file);

      _cachedFiles = _cachedFiles.map((file) {
        return file.fileId == event.file.fileId ? event.file : file;
      }).toList();

      emit(FileState.loaded(
        file: _cachedFiles,
        msg: FileMessage.updated.message,
        workOnIndex: null,
      ));
    } catch (e) {
      emit(state.maybeMap(
        initial: (_) => FileState.error(msg: FileMessage.updating.getErrorMessage(e)),
        loaded: (state) => state.copyWith(
          msg: FileMessage.updating.getErrorMessage(e),
          workOnIndex: null,
        ),
        orElse: () => state,
      ));
    }
  }

  Future<void> _onDeleteFile(DeleteFileEvent event, Emitter<FileState> emit) async {
    try {
      emit(state.maybeMap(
        initial: (_) => FileState.loading(msg: FileMessage.deleting.message),
        loaded: (state) => state.copyWith(
          msg: FileMessage.deleting.message,
          workOnIndex: state.file.indexWhere((file) => file.fileId == event.fileId),
        ),
        orElse: () => state,
      ));

      await repo.delete(event.fileId);

      _cachedFiles = _cachedFiles.where((file) => file.fileId != event.fileId).toList();

      emit(FileState.loaded(
        file: _cachedFiles,
        msg: FileMessage.deleted.message,
        workOnIndex: null,
      ));
    } catch (e) {
      emit(state.maybeMap(
        initial: (_) => FileState.error(msg: FileMessage.deleting.getErrorMessage(e)),
        loaded: (state) => state.copyWith(
          msg: FileMessage.deleting.getErrorMessage(e),
          workOnIndex: null,
        ),
        orElse: () => state,
      ));
    }
  }

  Future<void> _onLoadFiles(LoadBucketFilesEvent event, Emitter<FileState> emit) async {
    try {
      emit(state.maybeMap(
        initial: (_) => FileState.loading(msg: FileMessage.loading.message),
        loaded: (state) => state.copyWith(msg: FileMessage.loading.message),
        orElse: () => state,
      ));

      final files = await repo.getFileByBucketId(event.bucketId);
      _cachedFiles = files;

      emit(FileState.loaded(
        file: files,
        msg: files.isEmpty ? FileMessage.noFiles.message : FileMessage.loaded.message,
      ));
    } catch (e) {
      emit(state.maybeMap(
        initial: (_) => FileState.error(msg: FileMessage.loading.getErrorMessage(e)),
        loaded: (state) => state.copyWith(msg: FileMessage.loading.getErrorMessage(e)),
        orElse: () => state,
      ));
    }
  }
}
