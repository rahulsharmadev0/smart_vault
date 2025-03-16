part of '../repositories/organization_repository.dart';

sealed class OrganizationApi extends ApiBase {
  Future<void> create(Organization organization);

  Future<void> updateName(String orgId, String newName);

  Future<void> updateDescription(String orgId, String newDescription);

  Future<void> delete(String orgId);

  Future<Organization> getById(String orgId);
}
