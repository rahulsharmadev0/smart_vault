import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:repositories/cache/hive_cache.dart';
import 'package:repositories/models.dart';
import 'package:repositories/models/document_type.dart';
import 'package:repositories/utils/repository_base.dart';
import 'package:firebase_database/firebase_database.dart' as db;

part 'firebase_bucket_api.dart';
part 'firebase_bucket_cache.dart';

abstract class BucketBase {
  FutureOr<void> create(Bucket bucket);

  FutureOr<void> update(Bucket bucket);

  FutureOr<void> delete(String bucketId);

  FutureOr<Bucket?> getBucketById(String bucketId);

  FutureOr<List<Bucket>> getBucketsByOrgId(String orgId);

  FutureOr<void> updateTitle(String bucketId, String title);

  FutureOr<void> updateDescription(String bucketId, String description);

  FutureOr<void> updateFileTypes(String bucketId, List<DocumentType> fileTypes);

  FutureOr<void> updateAttributes(String bucketId, List<Attribute> attributes);
}
