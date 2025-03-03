part of 'organization_repository.dart';

abstract class OrganizationApi {
  Future<void> create(Organization organization);

  Future<void> updateName(String orgId, String newName);

  Future<void> updateDescription(String orgId, String newDescription);

  Future<void> delete(String orgId);

  Future<Organization> getById(String orgId);
}
