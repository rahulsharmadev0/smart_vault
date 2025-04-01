import 'package:bloc_suite/bloc_suite.dart';
import 'package:edukit/ui/env.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat/ai_chat.dart';
import 'package:storage_service/storage_service.dart';
import 'package:edukit/ui/modules/ai_chat/ai_chat_cubit.dart';

class AiChatScreen extends BlocWidget<AiChatCubit, AiChatState> {
  final String filePath;
  AiChatScreen({super.key, required this.filePath})
    : super(bloc: AiChatCubit(storageService: StorageService())..loadDocument(filePath));

  @override
  Widget build(context, bloc, state) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Chat')),
      body: switch (state.status) {
        AiChatStatus.initial ||
        AiChatStatus.loading => const Center(child: CircularProgressIndicator()),
        AiChatStatus.error => Center(child: Text('Error: ${state.errorMessage}')),
        AiChatStatus.loaded => AiChatView(
          geminiApiKey: Env.geminiApiKey,
          onResetApiKey: () {},
          document: (bytes: state.documentBytes!, mimeType: state.mimeType!),
        ),
      },
    );
  }
}
