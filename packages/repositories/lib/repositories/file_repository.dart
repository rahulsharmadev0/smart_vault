import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repositories/models.dart';
import 'package:repositories/repositories/repository_base.dart';

part '../api/file_api.dart';
part '../api/src/firebase_file_api.dart';

class FileRepository extends RepositoryBase<FileApi> {
  FileRepository(super.api);

  Future<void> create(DocumentFile file) {
    return api.create(file);
  }

  Future<void> update(DocumentFile file) {
    return api.update(file);
  }

  Future<void> delete(String fileId) {
    return api.delete(fileId);
  }

  Future<List<DocumentFile>> getFileByBucketId(String bucketId) {
    return api.getFileByBucketId(bucketId);
  }

  Future<DocumentFile> getFileByFileId(String fileId) {
    return api.getFileByFileId(fileId);
  }
}
