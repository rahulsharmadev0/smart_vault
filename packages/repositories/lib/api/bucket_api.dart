part of '../repositories/bucket_repository.dart';

sealed class BucketApi extends ApiBase {
  Future<void> create(Bucket bucket);

  Future<void> update(Bucket bucket);

  Future<void> delete(String bucketId);

  Future<Bucket> getBucketById(String bucketId);

  Future<List<Bucket>> getBucketsByOrgId(String orgId);

  Future<void> updateTitle(String bucketId, String title);

  Future<void> updateDescription(String bucketId, String description);

  Future<void> updateFileTypes(String bucketId, List<DocumentType> fileTypes);

  Future<void> updateAttributes(String bucketId, List<Attribute> attributes);
}
