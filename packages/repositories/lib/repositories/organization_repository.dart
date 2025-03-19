import 'package:repositories/models/organization.dart';
import 'package:repositories/utils/repository_base.dart';
import 'package:repositories/repositories/organization/organization_base.dart';

class OrganizationRepository extends CachedRepository<OrganizationApi, OrganizationCache>
    implements OrganizationBase {
  OrganizationRepository() : super(OrganizationApi(), OrganizationCache([]));

  Stream<List<Organization>> get dataStream => cache.cacheStream;

  @override
  Future<void> create(Organization organization) async {
    await api.create(organization);
    await cache.create(organization);
  }

  @override
  Future<void> delete(String orgId) async {
    await api.delete(orgId);
    await cache.delete(orgId);
  }

  @override
  Future<Organization?> getById(String orgId) async {
    final cachedOrg = await cache.getById(orgId);

    if (cachedOrg != null) {
      return cachedOrg;
    }

    final org = await api.getById(orgId);
    if (org != null) {
      await cache.create(org);
    }
    return org;
  }

  @override
  Future<void> updateDescription(String orgId, String newDescription) async {
    await api.updateDescription(orgId, newDescription);
    await cache.updateDescription(orgId, newDescription);
  }

  @override
  Future<void> updateName(String orgId, String newName) async {
    await api.updateName(orgId, newName);
    await cache.updateName(orgId, newName);
  }
}
