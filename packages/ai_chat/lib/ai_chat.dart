// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
    super.key,
  });

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

  late final _provider = GeminiProvider(
    model: GenerativeModel(model: widget.model, apiKey: widget.geminiApiKey),
  );

  @override
  void initState() {
    super.initState();
    _provider.sendMessageStream('Hello and welcome to the Smart Chat!');
    _resetAnimation();
  }

  void _resetAnimation() {
    _animationController.value = 1.0;
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return LlmChatView(
          provider: _provider,
          style: LlmChatViewStyle.defaultStyle(),
          welcomeMessage: 'Hello and welcome to the Smart Chat!',
          suggestions: [
            'Can you summarize this long doc into key points?',
            'Can you detect any inconsistencies in my argument?',
            'How can I improve the readability of this document?',
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
