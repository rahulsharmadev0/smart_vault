import 'dart:async';

import 'package:collection/collection.dart';
import 'package:repositories/models/organization.dart';
import 'package:repositories/utils/repository_base.dart';
import 'package:repositories/repositories/bucket/bucket_base.dart';

class BucketRepository extends CachedRepository<BucketApi, BucketCache>
    implements BucketBase {
  BucketRepository() : super(BucketApi(), BucketCache([]));

  Stream<List<Bucket>> get dataStream => cache.cacheStream;
  
  Stream<Bucket?> selectedStream(String bucketId) {
    return cache.cacheStream.map(
      (buckets) => buckets.firstWhereOrNull((b) => b.bucketId == bucketId),
    );
  }

  @override
  Future<void> create(Bucket bucket) async {
    await api.create(bucket);
    await cache.create(bucket);
  }

  @override
  Future<void> delete(String bucketId) async {
    await api.delete(bucketId);
    await cache.delete(bucketId);
  }

  @override
  Future<Bucket?> getBucketById(String bucketId) async {
    final cachedBucket = await cache.getBucketById(bucketId);

    if (cachedBucket != null) {
      return cachedBucket;
    }

    final bucket = await api.getBucketById(bucketId);
    if (bucket != null) {
      await cache.create(bucket);
    }
    return bucket;
  }

  @override
  Future<List<Bucket>> getBucketsByOrgId(String orgId) async {
    final cachedBuckets = await cache.getBucketsByOrgId(orgId);

    if (cachedBuckets.isNotEmpty) {
      return cachedBuckets;
    }

    final buckets = await api.getBucketsByOrgId(orgId);
    // Add buckets to cache
    for (final bucket in buckets) {
      await cache.create(bucket);
    }
    return buckets;
  }

  @override
  Future<void> update(Bucket bucket) async {
    await api.update(bucket);
    await cache.update(bucket);
  }

  @override
  Future<void> updateAttributes(
    String bucketId,
    List<Attribute> attributes,
  ) async {
    await api.updateAttributes(bucketId, attributes);
    await cache.updateAttributes(bucketId, attributes);
  }

  @override
  Future<void> updateDescription(String bucketId, String description) async {
    await api.updateDescription(bucketId, description);
    await cache.updateDescription(bucketId, description);
  }

  @override
  Future<void> updateFileTypes(
    String bucketId,
    List<DocumentType> fileTypes,
  ) async {
    await api.updateFileTypes(bucketId, fileTypes);
    await cache.updateFileTypes(bucketId, fileTypes);
  }

  @override
  Future<void> updateTitle(String bucketId, String title) async {
    await api.updateTitle(bucketId, title);
    await cache.updateTitle(bucketId, title);
  }
}
