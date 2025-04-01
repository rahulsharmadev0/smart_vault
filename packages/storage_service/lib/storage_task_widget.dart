import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

/// A widget that displays the current state of a Firebase Storage upload task.
///
/// This widget allows for monitoring upload progress and provides actions
/// like download, get link, and delete once the upload is complete.
class StorageTaskBuilder extends StatefulWidget {
  const StorageTaskBuilder({
    super.key,
    required this.task,
    required this.builder,
    this.onError,
    this.onCancel,
    this.onPause,
    this.onResume,
    this.onSuccess,
  });

  /// The Firebase Storage upload task to display.
  final UploadTask task;

  final VoidCallback? onError;

  final VoidCallback? onCancel;

  final VoidCallback? onPause;

  final VoidCallback? onResume;

  final VoidCallback? onSuccess;

  final Widget Function(BuildContext context, AsyncSnapshot<TaskSnapshot> asyncSnapshot)
  builder;

  @override
  State<StorageTaskBuilder> createState() => _StorageTaskBuilderState();
}

class _StorageTaskBuilderState extends State<StorageTaskBuilder> {
  StreamSubscription<TaskSnapshot>? _snapshotSubscription;

  @override
  void initState() {
    _snapshotSubscription = widget.task.snapshotEvents.listen(
      _onSnapshotEvent,
      onError: (_) => widget.onError,
    );
    super.initState();
  }

  void _onSnapshotEvent(TaskSnapshot snapshot) => switch (snapshot.state) {
    TaskState.success => widget.onSuccess?.call(),
    TaskState.canceled => widget.onCancel?.call(),
    TaskState.paused => widget.onPause?.call(),
    TaskState.running => widget.onResume?.call(),
    TaskState.error => widget.onError?.call(),
  };

  @override
  void dispose() {
    _snapshotSubscription?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant StorageTaskBuilder oldWidget) {
    if (oldWidget.task != widget.task) {
      _snapshotSubscription?.cancel();
      _snapshotSubscription = widget.task.snapshotEvents.listen(
        _onSnapshotEvent,
        onError: (_) => widget.onError,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) =>
      StreamBuilder(stream: widget.task.snapshotEvents, builder: widget.builder);
}

mixin TaskSnapshotExt on TaskSnapshot {
  /// Formats the bytes transferred into a human-readable string
  String _humanizeBytes(int bytes) {
    if (bytes == -1) {
      return '∞';
    }

    final kb = bytes / 1024;
    final mb = kb / 1024;

    if (mb >= 1.0) {
      return '${mb.toStringAsFixed(2)} MB';
    } else {
      return '${kb.toStringAsFixed(2)} KB';
    }
  }

  String get transferredHumanized => _humanizeBytes(bytesTransferred);

  String get totalHumanized => _humanizeBytes(totalBytes);

  double get percentage => (bytesTransferred / totalBytes) * 100;

  bool get isComplete => state == TaskState.success;

  bool get isFailed => state == TaskState.error;

  bool get isPaused => state == TaskState.paused;

  bool get isRunning => state == TaskState.running;

  bool get isCanceled => state == TaskState.canceled;
}
