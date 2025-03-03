part of 'bucket_repository.dart';

abstract class BucketApi {
  Future<void> create(String orgId, Bucket bucket);

  Future<void> update(String orgId, Bucket bucket);

  Future<void> delete(String orgId, String bucketId);

  Future<Bucket> getBucket(String orgId, String bucketId);

  Future<List<Bucket>> getBucketsByOrgId(String orgId);
}
