import 'dart:convert';

import 'package:firebase_database/firebase_database.dart' as db;
import 'package:repositories/models/organization.dart';

part 'organization_api.dart';
part 'organization_firebase_api.dart';

class OrganizationRepository {
  final OrganizationApi api;

  OrganizationRepository(this.api);

  Future<void> create(Organization organization) {
    return api.create(organization);
  }

  Future<void> updateName(String orgId, String newName) {
    return api.updateName(orgId, newName);
  }

  Future<void> updateDescription(String orgId, String newDescription) {
    return api.updateDescription(orgId, newDescription);
  }

  Future<void> delete(String orgId) {
    return api.delete(orgId);
  }

  Future<Organization> getById(String orgId) {
    return api.getById(orgId);
  }
}
