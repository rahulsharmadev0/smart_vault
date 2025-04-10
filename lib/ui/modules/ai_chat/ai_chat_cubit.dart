import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storage_service/storage_service.dart';

// Status enum to represent different states
enum AiChatStatus { initial, loading, loaded, error }

// Single state class with enum status
class AiChatState extends Equatable {
  final AiChatStatus status;
  final Uint8List? documentBytes;
  final String? mimeType;
  final String? errorMessage;

  const AiChatState({
    this.status = AiChatStatus.initial,
    this.documentBytes,
    this.mimeType,
    this.errorMessage,
  });

  // Factory constructors for different states
  factory AiChatState.initial() => const AiChatState();
  factory AiChatState.loading() => const AiChatState(status: AiChatStatus.loading);
  factory AiChatState.loaded({
    required Uint8List documentBytes,
    required String mimeType,
  }) => AiChatState(
    status: AiChatStatus.loaded,
    documentBytes: documentBytes,
    mimeType: mimeType,
  );

  factory AiChatState.error(String message) =>
      AiChatState(status: AiChatStatus.error, errorMessage: message);

  @override
  List<Object?> get props => [status, documentBytes, mimeType, errorMessage];
}

// Cubit
class AiChatCubit extends Cubit<AiChatState> {
  final StorageService _storageService;

  AiChatCubit({required StorageService storageService})
    : _storageService = storageService,
      super(AiChatState.initial());

  Future<void> loadDocument(String filePath) async {
    emit(AiChatState.loading());

    try {
      final data = await _storageService.createRef(filePath).getData();
      final metadata = await _storageService.createRef(filePath).getMetadata();

      if (data == null || metadata.contentType == null) {
        emit(AiChatState.error('Failed to load document'));
        return;
      }

      emit(AiChatState.loaded(documentBytes: data, mimeType: metadata.contentType!));
    } catch (e) {
      emit(AiChatState.error('Error: ${e.toString()}'));
    }
  }
}
