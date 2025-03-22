part of 'organization_base.dart';

class OrganizationCache<Data> extends HiveCache<List<Organization>>
    implements OrganizationBase {
  OrganizationCache(super.inital);

  @override
  FutureOr<void> create(Organization organization) {
    cache = [...cache, organization];
  }

  @override
  FutureOr<void> delete(String orgId) {
    cache = cache = [...cache]..removeWhere((org) => org.orgId == orgId);
  }

  @override
  FutureOr<Organization?> getById(String orgId) =>
      cache.firstWhereOrNull((org) => org.orgId == orgId);

  @override
  FutureOr<void> updateDescription(String orgId, String newDescription) {
    List<Organization> oldCache = [...cache];
    final index = oldCache.indexWhere((org) => org.orgId == orgId);
    if (index != -1) {
      Organization oldOrg = oldCache[index];
      oldCache[index] = oldOrg.copyWith(description: newDescription);
      cache = oldCache;
    }
  }

  @override
  FutureOr<void> updateName(String orgId, String newName) {
    List<Organization> oldCache = [...cache];
    final index = oldCache.indexWhere((org) => org.orgId == orgId);
    if (index != -1) {
      Organization oldOrg = oldCache[index];
      oldCache[index] = oldOrg.copyWith(name: newName);
      cache = oldCache;
    }
  }

  @override
  List<Organization> fromJson(Map<String, dynamic> json) =>
      List.from(
        json['organizations'] ?? [],
      ).map((org) => Organization.fromJson(Map.from(org))).toList();

  @override
  Map<String, dynamic> toJson(List<Organization> cache) => {
    'organizations': [for (final org in cache) org.toJson()],
  };
}
