part of 'file_repository.dart';

abstract class FileApi {
  Future<void> create(DocumentFile file);

  Future<void> update(DocumentFile file);

  Future<void> delete(String fileId);

  Future<List<DocumentFile>> getFileByBucketId(String bucketId);

  Future<DocumentFile> getFileByFileId(String fileId);
}
