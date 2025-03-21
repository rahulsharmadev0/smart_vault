import 'dart:async';
import 'package:cross_file/cross_file.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:storage_service/storage_manager.dart';

export 'package:storage_service/storage_manager.dart';
export 'package:storage_service/utils.dart';
export 'package:storage_service/storage_task_widget.dart';

/// A service for managing file storage operations.
class StorageService {
  /// Private static instance of the singleton
  static StorageService? _instance;

  /// Factory constructor that returns the singleton instance
  factory StorageService() {
    _instance ??= StorageService._internal();
    return _instance!;
  }

  /// Private constructor for the singleton pattern
  StorageService._internal() : _manager = StorageManager();

  /// The storage manager used by this service
  final StorageManager _manager;

  /// Gets a ValueNotifier containing a list of current upload tasks
  ValueNotifier<List<UploadTask>> get uploadTasks => _manager.uploadTasks;

  /// Removes a task at the specified index
  void removeTask(int index) => _manager.removeTaskAtIndex(index);

  /// Picks multiple files from the device
  ///
  /// [allowedExtensions] specifies which file extensions can be selected
  Future<List<XFile>> pickFiles({List<String> allowedExtensions = const []}) async {
    return await _manager.pickMultiFiles(allowedExtensions);
  }

  /// Uploads multiple files to Firebase Storage
  ///
  /// [files] is a list of XFile objects to be uploaded
  void uploadFiles(List<XFile> files) {
    _manager.uploadFiles(files);
  }

  /// Downloads a file as bytes and saves it locally
  ///
  /// [ref] is the Firebase Storage reference to the file
  Future<void> downloadBytes(Reference ref) async {
    await _manager.downloadBytes(ref);
  }

  /// Gets a download URL for a file
  ///
  /// [ref] is the Firebase Storage reference to the file
  /// Returns a String URL to the file
  Future<String> getDownloadURL(Reference ref) async {
    return await _manager.downloadLink(ref);
  }

  /// Deletes a file from Firebase Storage
  ///
  /// [ref] is the Firebase Storage reference to the file
  Future<void> deleteFile(Reference ref) async {
    await _manager.delete(ref);
  }

  /// Deletes multiple files from Firebase Storage
  ///
  /// [refs] is a list of Firebase Storage references to the files
  Future<void> deleteMultipleFiles(List<Reference> refs) async {
    await _manager.deleteAll(refs);
  }

  /// Gets the upload progress percentage from a TaskSnapshot
  ///
  /// [snapshot] is the current task snapshot
  /// Returns a double representing the percentage (0-100)
  double getUploadPercentage(TaskSnapshot snapshot) {
    return _manager.percentage(snapshot);
  }
}
