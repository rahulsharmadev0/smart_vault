import 'dart:convert';

import 'package:repositories/models.dart';
import 'package:repositories/repositories/repository_base.dart';
import 'package:firebase_database/firebase_database.dart' as db;

part '../api/bucket_api.dart';
part '../api/src/firebase_bucket_api.dart';

class BucketRepository extends RepositoryBase<BucketApi> {
  BucketRepository(super.api);

  Future<void> create(Bucket bucket) => api.create(bucket);

  Future<void> update(Bucket bucket) => api.update(bucket);

  Future<void> delete(String bucketId) => api.delete(bucketId);

  Future<Bucket> getBucketById(String bucketId) => api.getBucketById(bucketId);

  Future<List<Bucket>> getBucketsByOrgId(String orgId) => api.getBucketsByOrgId(orgId);

  Future<void> updateTitle(String bucketId, String title) => api.updateTitle(bucketId, title);

  Future<void> updateDescription(String bucketId, String description) =>
      api.updateDescription(bucketId, description);

  Future<void> updateFileTypes(String bucketId, List<DocumentType> fileTypes) =>
      api.updateFileTypes(bucketId, fileTypes);

  Future<void> updateAttributes(String bucketId, List<Attribute> attributes) =>
      api.updateAttributes(bucketId, attributes);
}
