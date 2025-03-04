part of 'bucket_repository.dart';

abstract class BucketApi {
  Future<void> create(Bucket bucket);

  Future<void> update(Bucket bucket);

  Future<void> delete(String bucketId);

  Future<Bucket> getBucketById(String bucketId);

  Future<List<Bucket>> getBucketsByOrgId(String orgId);

  Future<void> updateTitle(String bucketId, String title);

  Future<void> updateDescription(String bucketId, String description);

  Future<void> updateFileTypes(String bucketId, List<DocumentType> filetypes);

  Future<void> updateAttributes(String bucketId, List<Attribute> attributes);
}
