import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

/// A widget that displays the current state of a Firebase Storage upload task.
///
/// This widget allows for monitoring upload progress and provides actions
/// like download, get link, and delete once the upload is complete.
abstract class StorageTaskWidget extends StatelessWidget {
  const StorageTaskWidget({
    super.key,
    required this.task,
    this.onDownload,
    this.onDownloadLink,
    this.onDelete,
  });

  /// The Firebase Storage upload task to display.
  final UploadTask task;

  /// Optional callback triggered when the user presses the download button on a completed upload task.
  /// If null, the download button won't be displayed.
  final VoidCallback? onDownload;

  /// Optional callback triggered when the user presses the "link" button on a completed upload task.
  /// If null, the link button won't be displayed.
  final VoidCallback? onDownloadLink;

  /// Optional callback triggered when the user presses the "delete" button on a completed upload task.
  /// If null, the delete button won't be displayed.
  final VoidCallback? onDelete;

  /// Build the content of the upload task tile based on the current snapshot.
  ///
  /// Override this method to customize the appearance of the tile.
  ///
  /// [context] The build context.
  /// [asyncSnapshot] The latest snapshot of the task's progress.
  Widget buildContent(BuildContext context, AsyncSnapshot<TaskSnapshot> asyncSnapshot);

  @override
  @protected
  Widget build(BuildContext context) =>
      StreamBuilder<TaskSnapshot>(stream: task.snapshotEvents, builder: buildContent);
}

mixin UploadTaskListTileMixin on StorageTaskWidget {
  /// Formats the bytes transferred into a human-readable string
  String bytesTransferred(TaskSnapshot snapshot) {
    final kb = snapshot.bytesTransferred / 1024;
    final mb = kb / 1024;

    if (mb >= 1.0) {
      return '${mb.toStringAsFixed(2)} MB';
    } else {
      return '${kb.toStringAsFixed(2)} KB';
    }
  }
}
