import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/models/organization.dart';
import 'package:repositories/repositories.dart';

// States for the FilesCubit
abstract class FilesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FilesInitial extends FilesState {}

class FilesLoading extends FilesState {}

class FilesLoaded extends FilesState {
  final List<DocumentFile> files;

  FilesLoaded(this.files);

  @override
  List<Object?> get props => [files];
}

class FilesError extends FilesState {
  final String error;

  FilesError(this.error);

  @override
  List<Object?> get props => [error];
}

class FilesCubit extends Cubit<FilesState> {
  final FileRepository _fileRepository;
  StreamSubscription? _fileSubscription;
  String? _currentBucketId;

  FilesCubit({required FileRepository fileRepository})
    : _fileRepository = fileRepository,
      super(FilesInitial());

  void loadFiles(String bucketId) async {
    if (_currentBucketId == bucketId && state is FilesLoaded) return;

    _currentBucketId = bucketId;
    emit(FilesLoading());

    try {
      final files = await _fileRepository.getFileByBucketId(bucketId);
      emit(FilesLoaded(files));

      // Setup subscription for real-time updates if possible
      _setupSubscription(bucketId);
    } catch (e) {
      emit(FilesError('Failed to load files: $e'));
    }
  }

  void _setupSubscription(String bucketId) {
    _fileSubscription?.cancel();

    // If the repository provides a stream of files, subscribe to it
    // This is dependent on the implementation of FileRepository
    if (_fileRepository.hasStream) {
      _fileSubscription = _fileRepository
          .getFilesStream(bucketId)
          .listen(
            (files) => emit(FilesLoaded(files)),
            onError: (error) => emit(FilesError('Stream error: $error')),
          );
    }
  }

  void refreshFiles() {
    if (_currentBucketId != null) {
      loadFiles(_currentBucketId!);
    }
  }

  void uploadFile(DocumentFile file) async {
    try {
      await _fileRepository.create(file);
      refreshFiles();
    } catch (e) {
      emit(FilesError('Failed to upload file: $e'));
    }
  }

  void deleteFile(String fileId) async {
    try {
      await _fileRepository.delete(fileId);

      if (state is FilesLoaded) {
        final currentFiles = (state as FilesLoaded).files;
        emit(FilesLoaded(currentFiles.where((file) => file.fileId != fileId).toList()));
      }
    } catch (e) {
      emit(FilesError('Failed to delete file: $e'));
    }
  }

  @override
  Future<void> close() {
    _fileSubscription?.cancel();
    return super.close();
  }
}

// Extension to check if FileRepository has stream capabilities
extension FileRepositoryExt on FileRepository {
  bool get hasStream => false; // Implement based on actual repository capabilities

  Stream<List<DocumentFile>> getFilesStream(String bucketId) {
    // This would be implemented if the repository supports streaming
    throw UnimplementedError('Stream not available');
  }
}
