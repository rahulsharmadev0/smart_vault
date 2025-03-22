part of 'bucket_base.dart';

class BucketCache extends HiveCache<List<Bucket>> implements BucketBase {
  BucketCache(super.inital);

  @override
  FutureOr<void> create(Bucket bucket) {
    cache = [...cache, bucket];
  }

  @override
  FutureOr<void> delete(String bucketId) {
    cache = [...cache].where((bucket) => bucket.bucketId != bucketId).toList();
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
    List<Bucket> oldcache = [...cache];
    final index = oldcache.indexWhere((b) => b.bucketId == bucket.bucketId);
    if (index != -1) {
      oldcache[index] = bucket;
      cache = oldcache;
    }
  }

  @override
  FutureOr<void> updateAttributes(String bucketId, List<Attribute> attributes) {
    List<Bucket> oldcache = [...cache];
    final index = oldcache.indexWhere((b) => b.bucketId == bucketId);
    if (index != -1) {
      Bucket oldcache2 = oldcache[index];
      oldcache2 = oldcache2.copyWith(attributes: attributes);
      cache[index] = oldcache2;
    }
  }

  @override
  FutureOr<void> updateDescription(String bucketId, String description) {
    List<Bucket> oldcache = [...cache];
    final index = oldcache.indexWhere((b) => b.bucketId == bucketId);
    if (index != -1) {
      Bucket oldcache2 = oldcache[index];
      oldcache2 = oldcache2.copyWith(description: description);
      cache[index] = oldcache2;
    }
  }

  @override
  FutureOr<void> updateFileTypes(String bucketId, List<DocumentType> fileTypes) {
    List<Bucket> oldcache = [...cache];
    final index = oldcache.indexWhere((b) => b.bucketId == bucketId);
    if (index != -1) {
      Bucket oldcache2 = oldcache[index];
      oldcache2 = oldcache2.copyWith(fileTypes: fileTypes);
      cache[index] = oldcache2;
    }
  }

  @override
  FutureOr<void> updateTitle(String bucketId, String title) {
    List<Bucket> oldcache = [...cache];
    final index = oldcache.indexWhere((b) => b.bucketId == bucketId);
    if (index != -1) {
      Bucket oldcache2 = oldcache[index];
      oldcache2 = oldcache2.copyWith(title: title);
      cache[index] = oldcache2;
    }
  }

  @override
  Map<String, dynamic> toJson(List<Bucket> cache) => {
    'buckets': json.encode([for (final bucket in cache) bucket.toJson()]),
  };

  @override
  List<Bucket> fromJson(Map<String, dynamic> json) =>
      List.from(
        jsonDecode(json['buckets'] ?? []),
      ).map((bucket) => Bucket.fromJson(Map.from(bucket))).toList();
}
