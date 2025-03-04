import 'dart:convert';

import 'package:repositories/models.dart';
import 'package:firebase_database/firebase_database.dart' as db;

part 'bucket_api.dart';
part 'bucket_firebase_api.dart';

class BucketRepository {
  final BucketApi api;

  BucketRepository(this.api);

  Future<void> create(Bucket bucket) {
    return api.create(bucket);
  }

  Future<void> update(Bucket bucket) {
    return api.update(bucket);
  }

  Future<void> delete(String bucketId) {
    return api.delete(bucketId);
  }

  Future<Bucket> getBucketById(String bucketId) {
    return api.getBucketById(bucketId);
  }

  Future<List<Bucket>> getBucketsByOrgId(String orgId) {
    return api.getBucketsByOrgId(orgId);
  }

  Future<void> updateTitle(String bucketId, String title) {
    return api.updateTitle(bucketId, title);
  }

  Future<void> updateDescription(String bucketId, String description) {
    return api.updateDescription(bucketId, description);
  }

  Future<void> updateFileTypes(String bucketId, List<DocumentType> filetypes) {
    return api.updateFileTypes(bucketId, filetypes);
  }

  Future<void> updateAttributes(String bucketId, List<Attribute> attributes) {
    return api.updateAttributes(bucketId, attributes);
  }
}
