import 'dart:convert';

import 'package:firebase_database/firebase_database.dart' as db;
import 'package:repositories/models/organization.dart';
import 'package:repositories/repositories/repository_base.dart';

part '../api/organization_api.dart';
part '../api/src/organization_firebase_api.dart';

class OrganizationRepository extends RepositoryBase<OrganizationApi> {
  OrganizationRepository(super.api);

  Future<void> create(Organization organization) => api.create(organization);

  Future<void> updateName(String orgId, String newName) => api.updateName(orgId, newName);

  Future<void> updateDescription(String orgId, String newDescription) =>
      api.updateDescription(orgId, newDescription);

  Future<void> delete(String orgId) => api.delete(orgId);

  Future<Organization> getById(String orgId) => api.getById(orgId);
}
