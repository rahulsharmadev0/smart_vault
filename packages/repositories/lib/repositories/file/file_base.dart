import 'dart:async';

import 'package:collection/collection.dart';
import 'package:repositories/cache/hive_cache.dart';
import 'package:repositories/models.dart';
import 'package:repositories/utils/repository_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'firebase_file_cache.dart';
part 'firebase_file_api.dart';

abstract class FileBase {
  FutureOr<void> create(DocumentFile file);

  FutureOr<void> update(DocumentFile file);

  FutureOr<void> delete(String fileId);

  FutureOr<List<DocumentFile>> getFileByBucketId(String bucketId);

  FutureOr<DocumentFile?> getFilesByQuery(String fileId);
}
