part of 'bucket_base.dart';

class BucketCache extends HiveCache<List<Bucket>> implements BucketBase {
  BucketCache(super.inital);

  @override
  FutureOr<void> create(Bucket bucket) {
    List<Bucket> oldcache = List.of(cache);
    oldcache.add(bucket);
    cache = oldcache;
  }

  @override
  FutureOr<void> delete(String bucketId) {
    List<Bucket> oldcache = List.of(cache);
    oldcache.removeWhere((bucket) => bucket.bucketId == bucketId);
    cache = oldcache;
  }

  @override
  FutureOr<Bucket?> getBucketById(String bucketId) {
    return cache.firstWhereOrNull((bucket) => bucket.bucketId == bucketId);
  }

  @override
  FutureOr<List<Bucket>> getBucketsByOrgId(String orgId) =>
      cache.where((bucket) => bucket.orgId == orgId).toList();

  @override
  FutureOr<void> update(Bucket bucket) {
    List<Bucket> oldcache = List.of(cache);
    final index = oldcache.indexWhere((b) => b.bucketId == bucket.bucketId);
    if (index != -1) {
      oldcache[index] = bucket;
      cache = oldcache;
    }
  }

  @override
  FutureOr<void> updateAttributes(String bucketId, List<Attribute> attributes) {
    List<Bucket> oldcache = List.of(cache);
    final index = oldcache.indexWhere((b) => b.bucketId == bucketId);
    if (index != -1) {
      Bucket oldcache2 = oldcache[index];
      oldcache2 = oldcache2.copyWith(attributes: attributes);
      cache[index] = oldcache2;
    }
  }

  @override
  FutureOr<void> updateDescription(String bucketId, String description) {
    List<Bucket> oldcache = List.of(cache);
    final index = oldcache.indexWhere((b) => b.bucketId == bucketId);
    if (index != -1) {
      Bucket oldcache2 = oldcache[index];
      oldcache2 = oldcache2.copyWith(description: description);
      cache[index] = oldcache2;
    }
  }

  @override
  FutureOr<void> updateFileTypes(String bucketId, List<DocumentType> fileTypes) {
    List<Bucket> oldcache = List.of(cache);
    final index = oldcache.indexWhere((b) => b.bucketId == bucketId);
    if (index != -1) {
      Bucket oldcache2 = oldcache[index];
      oldcache2 = oldcache2.copyWith(fileTypes: fileTypes);
      cache[index] = oldcache2;
    }
  }

  @override
  FutureOr<void> updateTitle(String bucketId, String title) {
    List<Bucket> oldcache = List.of(cache);
    final index = oldcache.indexWhere((b) => b.bucketId == bucketId);
    if (index != -1) {
      Bucket oldcache2 = oldcache[index];
      oldcache2 = oldcache2.copyWith(title: title);
      cache[index] = oldcache2;
    }
  }

  @override
  Map<String, dynamic> toJson(List<Bucket> cache) => {
    'buckets': [for (final bucket in cache) bucket.toJson()],
  };
  @override
  List<Bucket> fromJson(Map<String, dynamic> json) => [
    for (final bucket in json['buckets'] ?? []) Bucket.fromJson(bucket),
  ];
}
