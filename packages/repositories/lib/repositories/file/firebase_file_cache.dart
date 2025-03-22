part of 'file_base.dart';

class FileCache extends HiveCache<List<DocumentFile>> implements FileBase {
  FileCache(super.inital);

  @override
  FutureOr<void> create(DocumentFile file) {
    cache = [...cache, file];
  }

  @override
  FutureOr<void> delete(String fileId) {
    cache = [...cache].where((file) => file.fileId != fileId).toList();
  }

  @override
  FutureOr<List<DocumentFile>> getFileByBucketId(String bucketId) {
    return cache.where((file) => file.bucketId == bucketId).toList();
  }

  @override
  FutureOr<DocumentFile?> getFilesByQuery(String fileId) =>
      cache.firstWhereOrNull((file) => file.fileId == fileId);

  @override
  FutureOr<void> update(DocumentFile file) {
    List<DocumentFile> oldcache = [...cache];
    final index = oldcache.indexWhere((f) => f.fileId == file.fileId);
    if (index != -1) {
      oldcache[index] = file;
      cache = oldcache;
    }
  }

  @override
  List<DocumentFile> fromJson(Map<String, dynamic> json) =>
      List.from(
        json['files'] ?? [],
      ).map((file) => DocumentFile.fromJson(Map.from(file))).toList();

  @override
  Map<String, dynamic> toJson(List<DocumentFile> cache) => Map.from({
    'files': [for (final file in cache) file.toJson()],
  });
}
