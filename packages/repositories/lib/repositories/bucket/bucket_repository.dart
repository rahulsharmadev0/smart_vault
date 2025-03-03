import 'package:repositories/models.dart';
import 'package:firebase_database/firebase_database.dart' as db;

part 'bucket_api.dart';
part 'bucket_firebase_api.dart';

class BucketRepository {
  final BucketApi api;

  BucketRepository(this.api);

  Future<void> create(String orgId, Bucket bucket) {
    return api.create(orgId, bucket);
  }

  Future<void> update(String orgId, Bucket bucket) {
    return api.update(orgId, bucket);
  }

  Future<void> delete(String orgId, String bucketId) {
    return api.delete(orgId, bucketId);
  }

  Future<Bucket> getBucket(String orgId, String bucketId) {
    return api.getBucket(orgId, bucketId);
  }

  Future<List<Bucket>> getBucketsByOrgId(String orgId) {
    return api.getBucketsByOrgId(orgId);
  }
}
