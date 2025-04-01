// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// JPG/JPEG: 	image/jpeg
// PDF: 	application/pdf
// PNG : Image	image/png
// DOCX:  (Word)	application/vnd.openxmlformats-officedocument.wordprocessingml.document
// XLSX:  (Excel)	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
// CSV: 	text/csv
class AiChatView extends StatefulWidget {
  const AiChatView({
    required this.geminiApiKey,
    this.model = 'gemini-1.5-flash',
    required this.onResetApiKey,
    this.document,
    super.key,
  });
  final ({String mimeType, Uint8List bytes})? document;
  final String model;

  final String geminiApiKey;
  final void Function() onResetApiKey;

  @override
  State<AiChatView> createState() => _AiChatViewState();
}

class _AiChatViewState extends State<AiChatView> with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
    lowerBound: 0.25,
    upperBound: 1.0,
  );

  late final GeminiProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = GeminiProvider(
      model: GenerativeModel(
        model: widget.model,
        apiKey: widget.geminiApiKey,
        systemInstruction: Content.text(
          'You are a professional document assistant specialized in analyzing and improving written content. '
          'When provided with documents, you will: '
          '1. Provide concise, well-structured summaries highlighting key points '
          '2. Identify logical inconsistencies, factual errors, or gaps in reasoning '
          '3. Suggest specific improvements for clarity, organization, and readability '
          '4. Maintain the original tone and intent while enhancing the quality '
          '5. Respond with actionable feedback that can be immediately applied '
          'Focus on being helpful, precise, and constructive in all interactions.',
        ),
      ),
      chatSafetySettings: [
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.low),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.low),
      ],
    );

    // Add document to history if available and send initial request
    if (widget.document != null) {
      _provider.history = [
        ChatMessage.user('Document', [
          FileAttachment.fileOrImage(
            name: 'document',
            mimeType: widget.document!.mimeType,
            bytes: widget.document!.bytes,
          ),
        ]),
      ];
    }
    _resetAnimation();
  }

  void _resetAnimation() {
    _animationController.value = 1.0;
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return LlmChatView(
          provider: _provider,
          welcomeMessage:
              widget.document == null ? 'Hello and welcome to the Smart Chat!' : null,
          suggestions: [
            'Summarize this document into key points?',
            'Please analyze this document and identify any inconsistencies or errors.',
            'How can I improve the readability of this document?',
            'What are the strengths and weaknesses of this document?',
            'Suggest a better structure for this document.',
            'Can you provide feedback on the tone and style?',
            'Identify areas where more evidence or examples would be helpful.',
          ],
        );
      },
    );
  }

  // IconButton(onPressed: _clearHistory, tooltip: 'Clear History', icon: const Icon(Icons.history)),

  void _clearHistory() {
    _provider.history = [];
    _resetAnimation();
  }
}
