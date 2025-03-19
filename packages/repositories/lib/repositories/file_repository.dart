import 'dart:async';

import 'package:repositories/models.dart';
import 'package:repositories/utils/repository_base.dart';
import 'package:repositories/repositories/file/file_base.dart';

class FileRepository extends CachedRepository<FileApi, FileCache> implements FileBase {
  FileRepository() : super(FileApi(), FileCache([]));

  Stream<List<DocumentFile>> get dataStream => cache.cacheStream;

  @override
  FutureOr<void> create(DocumentFile file) async {
    await api.create(file);
    await cache.create(file);
  }

  @override
  FutureOr<void> delete(String fileId) async {
    await api.delete(fileId);
    await cache.delete(fileId);
  }

  @override
  FutureOr<List<DocumentFile>> getFileByBucketId(String bucketId) async {
    final cachedFiles = await cache.getFileByBucketId(bucketId);

    if (cachedFiles.isNotEmpty) {
      return cachedFiles;
    }

    final files = await api.getFileByBucketId(bucketId);
    // Add files to cache
    for (final file in files) {
      await cache.create(file);
    }
    return files;
  }

  @override
  FutureOr<DocumentFile?> getFileByFileId(String fileId) async {
    final cachedFile = await cache.getFileByFileId(fileId);

    if (cachedFile != null) {
      return cachedFile;
    }

    final file = await api.getFileByFileId(fileId);
    if (file != null) {
      await cache.create(file);
    }
    return file;
  }

  @override
  FutureOr<void> update(DocumentFile file) async {
    await api.update(file);
    await cache.update(file);
  }
}
