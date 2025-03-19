part of 'file_base.dart';

class FileCache extends HiveCache<List<DocumentFile>> implements FileBase {
  FileCache(super.inital);

  @override
  FutureOr<void> create(DocumentFile file) {
    final List<DocumentFile> oldcache = List.of(cache);
    oldcache.add(file);
    cache = oldcache;
  }

  @override
  FutureOr<void> delete(String fileId) {
    final List<DocumentFile> oldcache = List.of(cache);
    oldcache.removeWhere((file) => file.fileId == fileId);
    cache = oldcache;
  }

  @override
  FutureOr<List<DocumentFile>> getFileByBucketId(String bucketId) {
    return cache.where((file) => file.bucketId == bucketId).toList();
  }

  @override
  FutureOr<DocumentFile?> getFileByFileId(String fileId) =>
      cache.firstWhereOrNull((file) => file.fileId == fileId);

  @override
  FutureOr<void> update(DocumentFile file) {
    final List<DocumentFile> oldcache = List.of(cache);
    final index = oldcache.indexWhere((f) => f.fileId == file.fileId);
    if (index != -1) {
      oldcache[index] = file;
      cache = oldcache;
    }
  }

  @override
  List<DocumentFile> fromJson(Map<String, dynamic> json) => [
    for (final file in json['files'] ?? []) DocumentFile.fromJson(file),
  ];

  @override
  Map<String, dynamic> toJson(List<DocumentFile> cache) => {
    'files': [for (final file in cache) file.toJson()],
  };
}
