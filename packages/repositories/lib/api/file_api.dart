part of '../repositories/file_repository.dart';

sealed class FileApi extends ApiBase {
  Future<void> create(DocumentFile file);

  Future<void> update(DocumentFile file);

  Future<void> delete(String fileId);

  Future<List<DocumentFile>> getFileByBucketId(String bucketId);

  Future<DocumentFile> getFileByFileId(String fileId);
}
