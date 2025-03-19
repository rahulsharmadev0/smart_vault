import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:repositories/cache/hive_cache.dart';
import 'package:repositories/models.dart';
import 'package:repositories/utils/repository_base.dart';
import 'package:firebase_database/firebase_database.dart' as db;
part 'organization_firebase_api.dart';
part 'organization_firebase_cache.dart';

abstract class OrganizationBase {
  FutureOr<void> create(Organization organization);

  FutureOr<void> updateName(String orgId, String newName);

  FutureOr<void> updateDescription(String orgId, String newDescription);

  FutureOr<void> delete(String orgId);

  FutureOr<Organization?> getById(String orgId);
}
