import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repositories/models.dart';

part 'file_api.dart';
part 'file_firebase_api.dart';

class FileRepository {
  final FileApi api;

  FileRepository(this.api);

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
